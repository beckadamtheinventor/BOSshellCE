
include 'include/ez80.inc'
include 'include/ti84pceg.inc'


org ti.cursorImage
; required: OP1 = name of program to edit
edit_basic_program_goto:
	ld iy,ti.flags
	ld hl,string_temp
	call	ti.Mov9ToOP1
	call	ti.ChkFindSym
	xor	a,a
	ld	(ti.menuCurrent),a
	call	ti.CursorOff
	call	ti.RunIndicOff
	ld	hl,string_temp
	push	hl
	ld	de,ti.progToEdit
	call	ti.Mov9b
	pop	hl
	dec	hl
	ld	de,ti.basic_prog
	call	ti.Mov9b
	ld	a,ti.cxPrgmEdit
	call	ti.NewContext
	xor	a,a
	ld	(ti.winTop),a
	call	ti.ScrollUp
	call	ti.HomeUp
	ld	a,':'
	call	ti.PutC
	call	ti.DispEOW
	ld	hl,$100
	ld.sis	(ti.curRow and $ffff),hl
	call	ti.BufToTop
	xor	a,a
	ld	(ti.menuCurrent),a
	set	7,(iy + $28)
	jp	ti.Mon

string_temp:=ti.cursorImage+$100

