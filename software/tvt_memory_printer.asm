; Author:    Artem Kalinchuk
; Created:   01.20.2024
;
; This software prints the memory contents
; of the computer out on the TV Typewriter's
; screen until it gets to the end and then
; repeats from the top again.

START:
  LHI 0x00           ; 056 000
  LLI 0x00           ; 066 000
  LEI 0x08           ; 046 010
  CAL PRINTADDR      ; 106 074 000

LOOP:
  LAL                ; 306
  CPI 0xFF           ; 074 377
  JTZ RESETHILO      ; 150 060 000
  LAM                ; 307
  CAL PRINTASCII     ; 106 112 000
  INL                ; 060
  DCE                ; 041
  LAE                ; 304
  CPI 0x00           ; 074 000
  JTZ RESETLINE      ; 150 043 000
  LAI 0x10           ; 006 020
  CAL OUTPUT         ; 106 154 000
  JMP LOOP           ; 104 011 000

RESETLINE:
  LAI 0x0D           ; 006 015
  CAL OUTPUT         ; 106 154 000
  LEI 0x08           ; 046 010
  CAL PRINTADDR      ; 106 074 000
  JMP LOOP           ; 104 011 000

RESETHILO:
  LAH                ; 305
  CPI 0xFF           ; 074 377
  JTZ START          ; 150 000 000
  LLI 0x00           ; 066 000
  INH                ; 050
  JMP LOOP           ; 104 011 000

PRINTADDR:
  LAH                ; 305
  CAL PRINTASCII     ; 106 112 000
  LAL                ; 306
  CAL PRINTASCII     ; 106 112 000
  LAI 0x3A           ; 006 072
  CAL OUTPUT         ; 106 154 000
  RET                ; 007

PRINTASCII:
  LBA                ; 310
  RAR                ; 032
  RAR                ; 032
  RAR                ; 032
  RAR                ; 032
  NDI 0x0F           ; 044 017
  CAL TOASCII        ; 106 133 000
  LAB                ; 301
  NDI 0x0F           ; 044 017
  CAL TOASCII        ; 106 133 000
  RET                ; 007

TOASCII:
  CPI 0x09           ; 074 011
  JFS ASCIILETTER    ; 120 146 000
  ADI 0x30           ; 004 060
  CAL OUTPUT         ; 106 154 000
  RET                ; 007

ASCIILETTER:
  ADI 0x37           ; 004 067
  CAL OUTPUT         ; 106 154 000
  RET                ; 007

OUTPUT:
  NOP                ; 311
  NOP                ; 311
  OUT 1              ; 123
  LCI 0x06           ; 026 006

DELAY:
  DCD                ; 031
  JFZ DELAY          ; 110 161 000
  DCC                ; 021
  JFZ DELAY          ; 110 161 000
  RET                ; 007
