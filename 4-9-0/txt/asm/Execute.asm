include 'include/ez80.inc'
include 'include/tiformat.inc'


;copy shell up
ld	de,$D1A881
ld	hl,de
ld	bc,($D006C3)		; get program size
add	de,bc
ld	bc,($D0118C)
add	hl,bc
lddr

;copy program to UserMem
ld	de,$D1A881
ld	hl,($D006C0)	; prgm Ptr
ld	bc,($D006C3)	; prgm Size
ld	($D0118C),bc
ldir

;push userMem
ld	hl,$D1A881
push hl
;push return code to the stack
ld	hl,$FFFFD3
add hl,sp
ld sp,hl
push hl
ex de,hl
ld hl,$D03110
ld bc,$00001B
ldir

jp $D1A881
