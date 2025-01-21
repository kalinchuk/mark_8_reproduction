; Author:    Artem Kalinchuk
; Created:   01.20.2024
;
; This software receives input from a keyboard
; (with last bit used a strobe) and outputs
; received characters to the TV Typewriter.
; It also stores in the characters in memory
; starting at address 100.

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
  CAL OUTPUT      ; 106 032 000

LISTEN_LOW:
  INP 0           ; 101
  RAL             ; 022
  JTC LISTEN_LOW  ; 140 022 000
  JMP LISTEN_HI   ; 104 004 000

OUTPUT:
  NOP             ; 311
  NOP             ; 311
  OUT 1           ; 123
  LCI 0x08        ; 026 010

DELAY:
  DECD            ; 031
  JFZ DELAY       ; 110 037 000
  DCC             ; 021
  JFZ DELAY       ; 110 037 000
  RET             ; 007