; A simple keyboard echo program which
; echos anything received on the keyboard
; to the output register display (port 0)

ORG 0x0

LISTEN_HI:
  INP 0           ; 101
  RAL             ; 022
  JFC LISTEN_HI   ; 100 000 000

  RAR             ; 032
  NDI 0x7F        ; 044 177
  OUT 0           ; 121

LISTEN_LOW:
  INP 0           ; 101
  RAL             ; 022
  JTC LISTEN_LOW  ; 140 011 000
  JMP LISTEN_HI   ; 104 000 000