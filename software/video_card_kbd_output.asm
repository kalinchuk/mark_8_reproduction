; Author:    Artem Kalinchuk
; Created:   01.30.2025
;
; Prints KBD input on screen using Len Bayles
; video card. This supports the return key
; and also the rubout key for deleting.
;
; DATA PORT: 5
; COLUMN PORT: 6
; ROW PORT: 7

INIT:
  LCI 0x00              ; row pos; 026 000
  LDI 0x00              ; col pos; 036 000
  LAI 0x00              ; 006 000
  OUT 6                 ; 135
  OUT 7                 ; 137

LISTEN_KBD:
  INP 0                 ; 101
  RAL                   ; 022
  JFC LISTEN_KBD        ; 100 010 000

  RAR                   ; 032
  NDI 0x7F              ; 044 177
  CAL PROCESS_CHAR      ; 106 033 000

LISTEN_KBD_LOW:
  INP 0                 ; 101
  RAL                   ; 022
  JTC LISTEN_KBD_LOW    ; 140 023 000
  JMP LISTEN_KBD        ; 104 010 000

PROCESS_CHAR:
  CPI 0x0D              ; CR ; 074 015
  JTZ INC_ROW           ; 150 140 000
  CPI 0x7F              ; DELETE ; 074 177
  JTZ DELETE            ; 150 051 000
  CAL PRINT             ; 106 121 000
  RET                   ; 007

DELETE:
  CAL DEC_POS           ; 106 064 000
  NOP                   ; for future deletion ; 311
  NOP                   ; 311
  NOP                   ; 311
  NOP                   ; 311
  NOP                   ; 311
  NOP                   ; 311
  NOP                   ; 311
  RET                   ; 007

DEC_POS:
  LAD                   ; 303
  CPI 0x00              ; 074 000
  JTZ DEC_ROW           ; 150 076 000
  DCD                   ; 031
  LAD                   ; 303
  OUT 6                 ; 135
  RET                   ; 007

DEC_ROW:
  LDI 0x20              ; 036 040
  LAD                   ; 303
  OUT 6                 ; 135
  LAC                   ; 302
  CPI 0x00              ; 074 000
  JTZ JUMP_TO_BOTTOM    ; 150 114 000
  DCC                   ; 021
  LAC                   ; 302
  OUT 7                 ; 137
  RET                   ; 007

JUMP_TO_BOTTOM:
  LCI 0x10              ; 026 020
  LAC                   ; 302
  OUT 7                 ; 137
  RET                   ; 007

PRINT:
  OUT 5                 ; 133
  CAL INC_POS           ; 106 126 000
  RET                   ; 007

INC_POS:
  LAD                   ; 303
  CPI 0x20              ; 074 040
  JTZ INC_ROW           ; 150 140 000
  IND                   ; 030
  LAD                   ; 303
  OUT 6                 ; 135
  RET                   ; 007

INC_ROW:      
  LDI 0x00              ; 036 000
  LAD                   ; 303
  OUT 6                 ; 135
  INC                   ; 020
  LAC                   ; 302
  CPI 0x10              ; 074 020
  JTZ RESET_ROW         ; 150 155 000
  OUT 7                 ; 137
  RET                   ; 007

RESET_ROW:      
  LCI 0x00              ; 026 000
  LAC                   ; 302
  OUT 7                 ; 137
  RET                   ; 007
