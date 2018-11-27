HEX = "0123456789ABCDEF"
FILES = "Execute//Asm_stub".split("//")

for FILE in FILES:
    f = open(FILE,"rb")
    dat = bytearray(f.read())
    f.close()
    out = ""
    for c in dat:
        out+=HEX[int(c/16)]+HEX[c%16]

    f = open(FILE+".hex","w")
    f.write(out)
    f.close()
