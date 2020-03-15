
;graphx header
db $C0,"GRAPHX",0,8

gfx_Begin:
	jp 0
gfx_End:
	jp 3
gfx_SetDraw:
	jp 27
gfx_SwapDraw:
	jp 30
gfx_ScaledTransparentSprite:
	jp 189
gfx_ZeroScreen:
	jp 228
gfx_Wait:
	jp 279

;FileIOC header
db $C0,'FILEIOC',0,1
ti_CloseAll:
	jp 0
ti_Open:
	jp 3
ti_Close:
	jp 9
ti_GetSize:
	jp 48
ti_GetDataPtr:
	jp 54

