
include 'include/ez80.inc'
include 'include/tiformat.inc'
include 'include/ti84pceg.inc'

prgm_data_ptr := $D01192
tempProgObj := 'zxyzxyzx'

execute_program:
	call	util_move_prgm_to_usermem		; execute assembly program
	call	util_install_error_handler
execute_assembly_program:
	ld	hl,return_asm
	push	hl
	jp	userMem

execute_basic_program:
	ld	hl,(prgm_data_ptr)
	ld	a,(hl)
	cp	a,tExtTok
	jr	nz,.not_unsquished			; check if actually an unsquished assembly program
	inc	hl
	ld	a,(hl)
	cp	a,tAsm84CePrgm
	jp	z,squish_program			; we've already installed an error handler
.not_unsquished:
	call	_ClrTxtShd
	call	_HomeUp
	call	_RunIndicOn
	bit	setting_basic_indicator,(iy + settings_flag)
	call	nz,_RunIndicOff
	call	_DisableAPD
	call	hook_home.save
	call	hook_home.set
	bit	prgm_archived,(iy + prgm_flag)
	jr	z,.in_ram
	call	util_delete_temp_program_get_name
	ld	hl,(prgm_real_size)
	push	hl
	ld	a,tempProgObj
	call	_CreateVar				; create a temp program so we can execute
	inc	de
	inc	de
	pop	bc
	call	_ChkBCIs0
	jr	z,.in_rom				; there's nothing to copy
	ld	hl,(prgm_data_ptr)
	ldi
	jp	po,.in_rom
	ldir
.in_rom:
	call	_OP4ToOP1
.in_ram:
	ld	de,appErr1
	ld	hl,string_error_stop
	ld	bc,string_error_stop.length
	ldir
	set	graphdraw,(iy + graphFlags)
	ld	hl,return_basic_error
	call	_PushErrorHandler
	res	apptextsave,(iy + appflags)		; text goes to textshadow
	set	progExecuting,(iy + newdispf)
	set	allowProgTokens,(iy + newDispF)
	res	7,(iy + $45)
	set	appAutoScroll,(iy + appflags)		; allow scrolling
	set	cmdExec,(iy + cmdFlags) 		; set these flags to execute basic program
	res	onInterrupt,(iy + onflags)
	ld	hl,return_basic
	push	hl
	sub	a,a
	ld	(kbdGetKy),a
	call	_EnableAPD
	ei
	jp	_ParseInp				; run program

	
	
util_del_prgm_from_usermem:
	or	a,a
	sbc	hl,hl
	ld	de,(asm_prgm_size)		; get program size
	ld	(asm_prgm_size),hl		; delete whatever was there
	ld	hl,userMem
	jp	_DelMem
	
	

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
	ret
	
	
util_move_prgm_name_to_op1:
	ld	hl,(prgm_ptr)
util_prgm_ptr_to_op1:
	ld	hl,(hl)
	push	hl				; vat pointer
	ld	de,6
	add	hl,de
	ld	a,(hl)				; get the type byte
	pop	hl
	ld	de,OP1				; store to op1
	ld	(de),a
	inc	de
	ld	b,(hl)
	dec	hl
.copy:
	ld	a,(hl)
	ld	(de),a
	inc	de
	dec	hl
	djnz	.copy
	xor	a,a
	ld	(de),a				; terminate the string
	ret

util_install_error_handler:
	ld	hl,return_asm_error
	jp	_PushErrorHandler
	
return_basic:
return_asm:					; handler for assembly / basic return
return:
	call	_PopErrorHandler
	ld	a,(return_info)
	cp	a,return_edit
	jr	z,.skip				; return properly from external editors
.quit:
.error:						; error handler for returning programs
	ld	a,return_prgm
.skip:
	ld	(return_info),a
	call	_RunIndicOff			; in case the launched program re-enabled it
	di					; in case the launched program enabled interrupts...
	call	_ClrAppChangeHook		; clear me!
	res	progExecuting,(iy + newDispf)
	res	cmdExec,(iy + cmdFlags)
	res	textInverse,(iy + textFlags)
	res	allowProgTokens,(iy + newDispF)
	res	onInterrupt,(iy + onFlags)
	call	_ReloadAppEntryVecs
	call	_DeleteTempPrograms
	call	_CleanAll
	di
	ld	de,(asm_prgm_size)
	or	a,a
	sbc	hl,hl
	ld	(asm_prgm_size),hl
	ld	hl,userMem
	call	_DelMem				; delete user program

	call	_ClrHomescreenHook
	res	appWantHome,(iy + sysHookFlg)
	ld	a,(backup_home_hook_location)
	or	a,a
	jr	z,.no_hook_restore
	ld	hl,(backup_home_hook_location)
	call	_SetHomescreenHook
	set	appWantHome,(iy + sysHookFlg)

.no_hook_restore:
.debounce:
	call	_GetCSC
	or	a,a
	jr	nz,.debounce			; debounce keys
	xor	a,a
	ld	(kbdGetKy),a			; flush keys
	jp	cesium_start