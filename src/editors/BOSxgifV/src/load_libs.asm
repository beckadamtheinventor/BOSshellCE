


; returns z if loaded, nz if not loaded
libload_load:
   jr   .tryfind
.inram:
   call   ti.Arc_Unarc
.tryfind:
   ld   hl,libload_name
   call   ti.Mov9ToOP1
   call   ti.ChkFindSym
   jr   c,.notfound
   call   ti.ChkInRam
   jr   z,.inram
   ld   hl,9 + 3 + libload_name.len
   add   hl,de
   ld   a,(hl)
   cp   a,$1f
   jr   c,.notfound
   dec   hl
   dec   hl
   ld   de,.relocations
   ld   bc,.notfound
   push   bc
   ld   bc,$aa55aa
   jp   (hl)
.notfound:
   xor   a,a
   inc   a
   ret

.relocations:
libload_libload:
   db   $c0, "LibLoad", $00, $1f


; -----------------------------------------------------
; put the libraries here
; see below code snippet for information
; -----------------------------------------------------

include 'used_funcs.asm'

   xor   a,a      ; return z (loaded)
   pop   hl      ; pop error return
   ret

libload_name:
   db   ti.AppVarObj, "LibLoad", 0
.len := $ - .

