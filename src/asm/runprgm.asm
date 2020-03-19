
include 'include/ez80.inc'
include 'include/ti84pceg.inc'


org ti.cursorImage
	ld iy,ti.flags
	ld (.oldsp),sp
	ld hl,ti.userMem
	ld de,(ti.asm_prgm_size)
	call ti.DelMem
	ld hl,-(stub.len+9)
	add hl,sp
	ld (.smc),hl
	ld sp,hl
	ld hl,$E30900
	call ti.Mov9ToOP1
	ld de,0
.smc:=$-3
	ld hl,shell_name
	ld bc,9
	ldir
	ld hl,stub
	ld bc,stub.len
	ldir
	call ti.ChkFindSym
	jr nc,.next
	ld bc,stub.len+9
	add hl,bc
	ld sp,hl
	ret
.next:
	call ti.ChkInRam
	ex de,hl
	jr z,.in_ram
	ld de,9
	add	hl,de
	ld e,(hl)
	add	hl,de
	inc	hl
.in_ram:
	call ti.LoadDEInd_s
	ld (ti.asm_prgm_size),de
	push hl
	push de
	ex hl,de
	ld de,ti.userMem
	call ti.InsertMem
	pop bc
	pop hl
	inc hl   ;$EF
	inc hl   ;$7B
	xor a,a
	ld de,ti.userMem
	ldir
	ld hl,0
.oldsp:=$-3
	push hl
	ld hl,(.smc)
	push hl
	ld c,9
	add hl,bc
	push hl       ; return vector
	jp ti.userMem
shell_name:
	db ti.ProtProgObj,"BOSSHELL"
stub:
	ld iy,ti.flags
	ld hl,ti.userMem
	ld de,(ti.asm_prgm_size)
	call ti.DelMem
	pop hl
	call ti.Mov9ToOP1
	call ti.ChkFindSym
	jr nc,.next
	pop hl
	ld sp,hl
	ret
.next:
	call ti.ChkInRam
	ex de,hl
	jr z,.in_ram
	ld de,9
	add	hl,de
	ld e,(hl)
	add	hl,de
	inc	hl
.in_ram:
	call ti.LoadDEInd_s
	ld (ti.asm_prgm_size),de
	push hl
	push de
	ex hl,de
	ld de,ti.userMem
	call ti.InsertMem
	pop bc
	pop hl
	xor a,a
	inc hl   ;$EF
	inc hl   ;$7B
	ld de,ti.userMem
	ldir
.exit:
	pop hl
	ld sp,hl
	jp ti.userMem
.len:=$-stub
