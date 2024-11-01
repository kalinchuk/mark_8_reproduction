; A simple keyboard input program that
; inputs data into the memory address
; specified by registers H and L 
; and outputs data to output register 0.

ORG 0x0

  LHI 0x00        ; 056 000
  LLI 0x40        ; 066 100

LISTEN_HI:
  INP 0           ; 101
  RAL             ; 022
  JFC LISTEN_HI   ; 100 004 000

  RAR             ; 032
  NDI 0x7F        ; 044 177
  OUT 0           ; 121

  LMA             ; 370
  INL             ; 060

LISTEN_LOW:
  INP 0           ; 101
  RAL             ; 022
  JTC LISTEN_LOW  ; 140 017 000
  JMP LISTEN_HI   ; 104 004 000