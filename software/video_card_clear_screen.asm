; Author:    Artem Kalinchuk
; Created:   02.02.2025
;
; Clears the screen of the video card
; designed by Len Bayles.
;
; DATA PORT: 5
; COLUMN PORT: 6
; ROW PORT: 7

INIT:
  LAI 0x00              ; 006 000
  OUT 6                 ; 135
  OUT 7                 ; 137
  CAL CLEAR             ; 106 010 000
  HLT                   ; 377

CLEAR:
  CAL INITCLEAR         ; 106 020 000
  ; clear last two positions
  LAI 0x20              ; 006 040
  OUT 5                 ; 133
  OUT 5                 ; 133
  RET                   ; 007

INITCLEAR:
  LBI 0xFF              ; 016 377
  LEI 0x01              ; 046 001
CLEARLOOP:
  LAI 0x20              ; 006 040
  OUT 5                 ; 133
  DCB                   ; 011
  LAB                   ; 301
  CPI 0x00              ; 074 000
  JTZ DECE              ; 150 041 000
  JMP CLEARLOOP         ; 104 024 000
DECE:
  LAE                   ; 304
  CPI 0x00              ; 074 000
  RTZ                   ; 053
  LBI 0xFF              ; 016 377
  DCE                   ; 041
  JMP CLEARLOOP         ; 104 024 000
