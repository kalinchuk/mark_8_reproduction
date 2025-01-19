; Outputs all characters to Don Lancaster's
; TV Typewriter. Since a lot of the characters
; are not supported by the TVT, you will see
; a lot of blanks. The TVT uses output port A
; with the strobe connected to keypress on TVT.
; Refer to the Mark-8 construction manual (page 5)
; on the hookup details.

ORG 0x0

        LBI 777      ; 016 777
INC:    INB          ; 010
        LAB          ; 301
        CAL OUTPUT   ; 106 013 000
        JMP INC      ; 104 002 000
        HLT          ; 777

OUTPUT: OUT 1        ; 123
        LCI 007      ; 026 007      ; increase this value to increase delay

LOOP:   DCD          ; 031
        JFZ LOOP     ; 110 016 000
        DCC          ; 021
        JFZ LOOP     ; 110 016 000
        RET          ; 007