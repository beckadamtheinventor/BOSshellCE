
include 'include/ez80.inc'
include 'include/ti84pceg.inc'

;back buffer, row 20, col 1.
VRAM_BUF:=$D40000+320*240+20*320+1

org ti.cursorImage+$380
	ld hl,0 ;replace with address of background image
	call ti.LoadDEInd_s
	ld a,(hl)
	push hl
	ld hl,320
	or a,a
	sbc hl,de
	ld (.rem),hl
	pop hl
	push de
	pop bc
	ld de,VRAM_BUF
.loop:
	push af
	push bc
	ldir
	ld bc,0
.rem:=$-3
	ex hl,de
	add hl,bc
	ex hl,de
	pop bc
	pop af
	dec a
	jr nz,.loop
	ret

