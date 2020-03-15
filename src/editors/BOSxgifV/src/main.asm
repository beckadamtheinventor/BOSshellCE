

include 'include/ez80.inc'
include 'include/tiformat.inc'
include 'include/ti84pceg.inc'
format ti appvar "BOSxgifV"

	db $EF,$7B
org ti.userMem
	jp init
	db 1,"BOSshell xgif viewer v2.0",0
init:
	call libload_load
	jr z,main_init
	call ti.HomeUp
	ld hl,.needlibload
	call ti.PutS
	xor a,a
	ld (ti.curCol),a
	inc a
	ld (ti.curRow),a
	call ti.PutS
	call GetCSC
	jp full_exit+5+8
.needlibload:
	db "Need libLoad",0
	db "tiny.cc/clibs",0
GetCSC:
	call ti.GetCSC
	or a,a
	jr z,GetCSC
	ret
main_init:
	call ti.HomeUp
	call ti.RunIndicOff
	call gfx_Begin
	call ti_CloseAll
	ld hl,mode_open_r
	push hl
	ld hl,packet_file
	push hl
	call ti_Open
	pop hl
	pop hl
	or a,a
	jp z,full_exit+5
	ld l,a
	push hl
	call ti_GetDataPtr
	ld (pack_ptr),hl
	call ti_Close
	pop hl
	ld hl,0
pack_ptr:=$-3
	inc hl
	inc hl
	ld de,mode_open_r
	push de
	push hl
	call ti_Open
	pop hl
	pop hl
	or a,a
	jp z,full_exit+5
	ld l,a
	push hl
	call ti_GetDataPtr
	ld (file_ptr),hl
	call ti_GetSize
	ld de,(file_ptr)
	add hl,de
	ld (file_max),hl
	call ti_Close
	pop hl
	ld l,1
	push hl
	call gfx_SetDraw
	pop hl
	call gfx_ZeroScreen
	ld hl,0
file_ptr:=$-3
	ld bc,-1
.loop:     ;skip the file header
	xor a,a
	cpir
	ld a,(hl)
	or a,a
	jr nz,.loop
	inc hl
	ld a,(hl)
	or a,a
	jp z,full_exit+5
	inc hl
	ld (wait_time),a
	ld de,0
	ld d,(hl)
	inc hl
	ld e,(hl)
	dec hl
	push de
	ld (frames_ptr),hl
	mlt de
	inc de
	inc de
	ld (sprite_len),de
	or a,a
	sbc hl,hl
	sbc hl,de
	pop de
	jp z,full_exit+5
	push de
	ld hl,320
	xor a,a
	ld d,a
.loop1:
	inc a
	sbc hl,de
	jr nc,.loop1
	add hl,de
	pop de
	ld (.loop1result),a
	ld e,d
	xor a,a
	ld d,a
	ld hl,240
.loop2:
	inc a
	sbc hl,de
	jr nc,.loop2
	add hl,de
	cp a,0
.loop1result:=$-1
	jr c,.e_gt_a
	ld a,e
.e_gt_a:
	or a,a
	sbc hl,hl
	ld l,a
	push hl
	push hl
	ld l,0
	push hl
	push hl
first_frame:
	call ti.GetCSC
	cp a,ti.skClear
	jp z,full_exit+1
	ld hl,(frames_ptr)
	push hl
	ld (savesp),sp
main:
	ld hl,(savesp)
	ld hl,(hl)
	ld a,(hl)
	or a,a
	jr nz,.cont
.gotofirst:
	pop bc
	jr first_frame
.cont:
	call gfx_Wait
	call gfx_ScaledTransparentSprite
	ld hl,0
savesp:=$-3
	ld de,(hl)
	ex hl,de
	ld bc,0
sprite_len:=$-3
	add hl,bc
	ex hl,de
	ld (hl),de
	push de
	push hl
	call gfx_SwapDraw
	pop de
	pop hl
	ld bc,0
file_max:=$-3
	or a,a
	sbc hl,bc
	jr c,.cont2
	ex hl,de
	ld de,0
frames_ptr:=$-3
	ld (hl),de
.cont2:
	ld b,0
wait_time:=$-1
.wait:
	push bc
	call ti.Delay10ms
	pop bc
	djnz .wait
	call ti.GetCSC
	or a,a
	jr z,main
	cp a,ti.skEnter ;pause the animation
	call z,GetCSC
	cp a,ti.skClear ;exit
	jr nz,main
full_exit:
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	call gfx_End
	call ti_CloseAll
	call ti.DrawStatusBar
	jp ti.HomeUp

packet_file:
	db '__B',0
mode_open_r:
	db 'r',0

include 'load_libs.asm'

