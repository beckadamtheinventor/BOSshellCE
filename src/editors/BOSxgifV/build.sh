#!/bin/bash
#----------------------------------------
#Put your program name in place of "DEMO"
name='BOSxgifV.8Xv'
#----------------------------------------

mkdir "bin" || echo ""

echo "compiling to $name"
~/CEdev/bin/fasmg src/main.asm bin/$name
echo $name
echo "Wrote binary to $name."

read -p "Finished. Press any key to exit"
