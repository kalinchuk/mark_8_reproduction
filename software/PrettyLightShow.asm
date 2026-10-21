/***************************************************
* Pretty Lights-W/ TVT V2.0
* Never ending, random light show.
*
* By Bryan Blackburn, Copyright 2005.
* http://bytecollector.com
*
* Recovered from PrettyLightShow.pdf. Octal bytes
* in the listing were translated to 8008 mnemonics.
* Jumps use high-byte 001, so this loads at 0100H.
*
* INP 2  = front-panel switches (hardware mods)
* OUT 8  = lamp/LED port
* OUT 9  = Digital Group TVT character port
* Page 2 (0200H) = 256 bytes of TVT screen data (this file includes a
* banner + stars). After each character the code outputs 00 as a TVT
* blanking pulse. Lamp pattern starts from INP 2 (send a non-zero byte
* on port 2 for an interesting show).
***************************************************/

        ORG 0100H

; --- shift pattern left ---
LIGHTS: LBI 000Q            ; pattern hold time counter
        INP 2               ; read front-panel switches
LEFT:   LEI 040Q            ; shift-left count
A:      OUT 8               ; send pattern to lamps
        DCE
        JTZ RIGHT           ; done shifting left; go right
        RLC                 ; rotate pattern left
        CAL DELAY
        DCB
        JFZ A
        LBA                 ; scramble pattern a little
        INP 2
        ACB                 ; A = A + B + carry
        JMP A

; --- shift pattern right ---
RIGHT:  LEI 070Q            ; shift-right count
B:      OUT 8
        DCE
        JTZ LEFT            ; done shifting right; go left
        RRC                 ; rotate pattern right
        CAL DELAY
        DCB
        JFZ B               ; listing said "jump if zero"; opcode 110Q is JFZ
        LBA
        INP 2
        ACB
        JMP A

; --- delay + optional TVT "screen dazzle" ---
DELAY:  LCI 006Q
LOOP3:  LDI 000Q            ; inner loop 256 times
LOOP2:  DCD
        JFZ LOOP2
        DCC
        JFZ LOOP3
        CPI 200Q            ; screen-update rate; lower = more often
        RTC                 ; skip TVT if carry set
        LCA                 ; save A in C
        LHI 002Q            ; H = TVT data page
        LLA                 ; L = randomized start
GETCHAR:
        LAM                 ; A = (HL)
        OUT 9               ; send character to TVT
        XRA                 ; A = 0
        OUT 9
        INL                 ; next source address
        LAC                 ; start offset (saved A)
        CPL                 ; done when L wraps back to start
        JFZ GETCHAR
        RET

; Digital Group TVT character data (page 2). The original listing
; left this blank: "load page 002 with some stars, a little text..."
; GETCHAR walks all 256 bytes, so fill the whole page. After each
; character the routine outputs 00 (XRA / OUT 9) as a TVT blanking
; pulse — that is normal, not a stuck accumulator.
        ORG 0200H
        DB "PRETTY LIGHTS-W/ TVT * BYTECOLLECTOR"
        DB "************************************"
        DB "* LAMPS OUT 8   SWITCHES INP 2     *"
        DB "* TVT CHARS OUT 9  (00=TVT BLANK)  *"
        DB "************************************"
        DB "* * * * * * * * * * * * * * * * * *"
        DB ". . . . . . . . . . . . . . . . . ."
        DB "************************************"
