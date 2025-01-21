  LHI 0x00           ; 056 000
  LLI 0x00           ; 066 000
  LEI 0x08           ; 046 010

LOOP:
  LAM                ; 307
  RAR                ; 032
  RAR                ; 032
  RAR                ; 032
  RAR                ; 032
  NDI 0x0F           ; 044 017
  CAL TOASCII        ; 106 060 000
  LAM                ; 307
  NDI 0x0F           ; 044 017
  CAL TOASCII        ; 106 060 000
  INL                ; 060
  DCE                ; 041
  LAE                ; 304
  CPI 0x00           ; 074 000
  JTZ RESETLINE      ; 150 046 000
  LAI 0x3A           ; 006 072
  CAL OUTPUT         ; 106 101 000
  JMP LOOP           ; 104 006 000

RESETLINE:
  LAI 0x0D           ; 006 015
  CAL OUTPUT         ; 106 101 000
  LEI 0x08           ; 046 010
  JMP LOOP           ; 104 006 000

TOASCII:
  CPI 0x09           ; 074 011
  JFS LETTER         ; 120 073 000
  ADI 0x30           ; 004 060
  CAL OUTPUT         ; 106 101 000
  RET                ; 007

LETTER:
  ADI 0x37           ; 004 067
  CAL OUTPUT         ; 106 101 000
  RET                ; 007

OUTPUT:
  NOP                ; 311
  NOP                ; 311
  OUT 1              ; 123
  LCI 0x06           ; 026 006

DELAY:
  DCD                ; 031
  JFZ DELAY          ; 110 106 000
  DCC                ; 021
  JFZ DELAY          ; 110 106 000
  RET                ; 007