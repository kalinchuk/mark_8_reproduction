#
# Author:    Artem Kalinchuk
# Created:   11.01.2024
#
# A simple Intel 8008 assembler that can output a file format
# of either octal, hex or binary. The op codes may not be a
# complete set since new ones are added as they are needed.
#

require 'optparse'

OPCODES = {
  'ADI' => { code: 0o004, args: 1 },
  'DCD' => { code: 0o031 },
  'DCC' => { code: 0o021 },
  'DCE' => { code: 0o041 },
  # (H <- B2) Load byte two of the instruction into register H.
  'LHI' => { code: 0o056, args: 1 },
  # (L <- B2) Load byte two of the instruction into register L.
  'LLI' => { code: 0o066, args: 1 },
  'LAB' => { code: 0o301 },
  'LAM' => { code: 0o307 },
  'LAE' => { code: 0o304 },
  'LAH' => { code: 0o305 },
  'LAI' => { code: 0o006, args: 1 },
  'LAL' => { code: 0o306 },
  'LBA' => { code: 0o310 },
  'LCI' => { code: 0o026, args: 1 },
  'LEI' => { code: 0o046, args: 1 },
  #  (M <- A) Load the memory location addressed by
  # the contents of registers H and L with the content
  # of register A.
  'LMA' => { code: 0o370 },
  # (H <- H + 1) The content of register H is incremented
  # by one. All of the condition flip-flops except carry
  # are affected by the result.
  'INH' => { code: 0o050 },
  # (L <- L + 1) The content of register L is incremented
  # by one. All of the condition flip-flops except carry
  # are affected by the result.
  'INL' => { code: 0o060 },
  'INP' => { '0' => { code: 0o101 } },
  'RAL' => { code: 0o022 },
  'RAR' => { code: 0o032 },
  'RET' => { code: 0o007 },
  'OUT' => { '0' => { code: 0o121 }, '1' => { code: 0o123 } },
  # (P <- B3B2) Jump unconditionally to the instruction located
  # in memory location addressed by byte two and byte three.
  'JMP' => { code: 0o104, args: 2 },
  'CAL' => { code: 0o106, args: 2 },
  'CPI' => { code: 0o074, args: 1 },
  'CTZ' => { code: 0o152, args: 2 },
  'JFC' => { code: 0o100, args: 2 },
  'JTC' => { code: 0o140, args: 2 },
  'JFS' => { code: 0o120, args: 2 },
  'JFZ' => { code: 0o110, args: 2 },
  'JTZ' => { code: 0o150, args: 2 },
  'NDI' => { code: 0o044, args: 1 },
  'NOP' => { code: 0o311 }
}

def format_output(opcode, args, format_str)
  [format_str % opcode] + args.map { |arg| format_str % convert_arg(arg) }
end

def convert_arg(value)
  case value
  when /\A0[xX][\da-fA-F]+\z/
    value.to_i(16)
  when /\A[+-]?\d+\z/
    value.to_i
  else
    value
  end
end

def parse_lines(lines)
  labels = {}
  instructions = []
  address_counter = 0

  lines.each do |line|
    line = line.strip.split(';').first  # Remove comments
    next if line.nil? || line.empty?

    if line =~ /\AORG\s+0[xX][\da-fA-F]+\z/
      address_counter = line.split.last.to_i(16)
      next
    end

    if line.include?(':')
      label, instruction = line.split(':', 2).map(&:strip)
      labels[label] = address_counter
      line = instruction unless instruction.nil?
    end

    next if line.nil? || line.empty?

    parts = line.gsub(',', ' ').split(/\s+/)
    mnemonic = parts.shift
    arguments = parts
    opcode_entry = OPCODES[mnemonic]

    raise "Unknown instruction: #{mnemonic}" unless opcode_entry

    if opcode_entry[:code]
      address_counter += 1 + opcode_entry[:args].to_i
      instructions << [opcode_entry[:code], arguments]
    elsif opcode_entry[arguments.join]
      sub_opcode_entry = opcode_entry[arguments.shift]
      address_counter += 1
      instructions << [sub_opcode_entry[:code], arguments]
    else
      raise "Instruction #{mnemonic} does not support #{arguments.join(', ')}"
    end
  end

  [instructions, labels]
end

def select_format_options(output_format)
  case output_format
  when 'h'
    { format_str: '%02X', file_extension: 'hex' }
  when 'o'
    { format_str: '%03o', file_extension: 'oct' }
  when 'b'
    { format_str: '%08b', file_extension: 'bin' }
  else
    raise "Invalid output format: #{output_format}"
  end
end

def assemble(lines, options = {})
  options[:output] ||= 'o'
  options[:delimiter] ||= ''

  format_options = select_format_options(options[:output])
  format_str = format_options[:format_str]
  file_extension = format_options[:file_extension]

  instructions, labels = parse_lines(lines)

  output = instructions.flat_map do |opcode, arguments|
    if arguments[0] && labels[arguments[0]]
      address = labels[arguments[0]]
      format_output(opcode, [address & 0xFF, (address >> 8) & 0xFF], format_str)
    else
      format_output(opcode, arguments, format_str)
    end
  end

  file_name = "#{options[:file_name]}.#{file_extension}"
  File.write(file_name, output.join(options[:delimiter]))
end

if ARGV.empty?
  puts "Usage: 8008_assembler.rb [file] [-o output format (o[ctal], h[ex], b[inary])] [-d delimiter]"
  exit
end

options = {}
OptionParser.new do |opt|
  opt.on('-o', '--output FORMAT', 'o (octal), h (hex), b (binary)') { |o| options[:output] = o }
  opt.on('-d', '--delimiter DELIMITER', 'none (default)') { |d| options[:delimiter] = d }
end.parse!

input_file_name = ARGV[0]
source_code = File.read(input_file_name)
options[:file_name] = File.basename(input_file_name, ".*")
assemble(source_code.split("\n"), options)