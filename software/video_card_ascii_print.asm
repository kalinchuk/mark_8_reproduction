; Author:    Artem Kalinchuk
; Created:   01.30.2025
;
; Outputs all ASCII characters to the video
; card designed by Len Bayles. This video card
; uses two output ports to specify the cursor
; position and one output port for the actual
; data to be displayed.
;
; The program is slowed down so the text could
; scroll on the screen.
;
; DATA PORT: 5
; COLUMN PORT: 6
; ROW PORT: 7

INIT:
  LCI 0x00        ; row pos; 026 000
  LDI 0x00        ; col pos; 036 000
  LAI 0x00        ; 006 000
  OUT 6           ; 135
  OUT 7           ; 137

LBI 0x00          ; 016 000
OUTCHAR:
  CAL PRINT       ; 106 057 000
  CAL INC_POS     ; 106 023 000
  JMP OUTCHAR     ; 104 012 000

INC_POS:
  LAD             ; 303
  CPI 0x20        ; 074 040
  JTZ INC_ROW     ; 150 035 000
  IND             ; 030
  LAD             ; 303
  OUT 6           ; 135
  RET             ; 007

INC_ROW:
  LDI 0x00        ; 036 000
  LAD             ; 303
  OUT 6           ; 135
  INC             ; 020
  LAC             ; 302
  CPI 0x10        ; 074 020
  JTZ RESET_ROW   ; 150 052 000
  OUT 7           ; 137
  RET             ; 007

RESET_ROW:
  LCI 0x00        ; 026 000
  LAC             ; 302
  OUT 7           ; 137
  RET             ; 007

PRINT:
  LAB             ; 301
  OUT 5           ; 133
  INB             ; 010
  LEI 0xFF        ; 046 377
LOOP:
  DCE             ; 041
  LAE             ; 304
  CPI 0x00        ; 074 000
  RFZ             ; 053
  JMP LOOP        ; 104 064 000
