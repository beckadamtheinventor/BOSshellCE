include 'include/ez80.inc'
include 'include/tiformat.inc'

di

;get pointer to shell prgm
ld	hl,shell_name
call _Mov9ToOP1
call _ChkFindSym
push de
ld	de,(hl)
push de
;load shell back into userMem
pop hl
pop bc
ld	de,$D1A881
ldir

ld	hl,$00002D
add	hl,sp
ld	sp,hl

ret

shell_name:
	.db $06, "BOSSHELL"
