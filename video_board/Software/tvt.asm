	;
	; tvt.asm
	;
	; Intel 8008 source code file.
	;
	; Copyright 2015 by Len Bayles
	;


PORT_IN:	equ 0
PORT_OUT:	equ 0

CHAR_OUT:	equ 5
COL_OUT:	equ 6
ROW_OUT:	equ 7



	; page 0

	cpu	8008

	org	000#000

main:
	lai	0x00
	out	COL_OUT	; Put value on output port
	out	ROW_OUT	; Put value on output port

	lai	0x48
	out	CHAR_OUT	; Put value on output port

	lai	0x69
	out	CHAR_OUT	; Put value on output port

	
	end
