util_move_prgm_to_usermem:
	ld	a,$9				; 'add hl,bc'
	ld	(.smc),a
	call	_ChkFindSym
	call	_ChkInRam
	ex	de,hl
	jr	z,.in_ram
	xor	a,a
	ld	(.smc),a
	ld	de,9
	add	hl,de
	ld	e,(hl)
	add	hl,de
	inc	hl
.in_ram:					; hl -> size bytes
	call	_LoadDEInd_s
	inc	hl
	inc	hl				; bypass tExtTok, tAsm84CECmp
	push	hl
	push	de
	ex	de,hl
	call	_ErrNotEnoughMem		; check and see if we have enough memory
	pop	hl
	ld	(asm_prgm_size),hl		; store the size of the program
	ld	de,userMem
	push	de
	call	_InsertMem			; insert memory into usermem
	pop	de
	pop	hl				; hl -> start of program
	ld	bc,(asm_prgm_size)		; load size of current program
.smc := $
	add	hl,bc				; if not in ram smc it so it doesn't execute
	ldir					; copy the program to userMem
	ret					; return
