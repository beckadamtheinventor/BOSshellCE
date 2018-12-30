BOSshell version 4.10.3 for TI-84+CE
by beckadamtheinventor


ABOUT:
BOSshell stands for Beck's Operational shell. This shell can be used for a number of different file making and processing programs.
It currently only uses appvars for files; however, these appvars can have specific file types, in a system that is entirely seperate from the variable type.
This shell is still very much still in development.
If you do encounter a bug or crash, please report it to me on the Cemetech.net forums


CREDITS:
Thank you to all the folks at Cemetech!
Special thanks to LAX18 and jcgter777 for their ongoing support! (and reminding me to work on this)
Special thanks to all the assembly experts on Cemetech for their patience in teaching me eZ80 Assembly,
and numerous other things that were instrumental in my creation of this shell!
And a very special thanks to KermPHD, for Doors, the inspiration for BOSshell!
Seriously, thank you all! :)
-beckadamtheinventor


INSTALLATION:
Send "BOSSHELL.8xp" and "BOSdata.8xv" to your CE using TI-Connect or TILP. Select the program from the [prgm] list, then press [enter] to run it.
The shell will load momentarily! :D


USAGE:
When the desktop appears, there will be a cursor, which you can move around with the arrow keys.
Holding the arrow keys or pressing them repeatedly will speed up the cursor.
Pressing [clear] will exit the shell.
Right-click with [alpha] or [graph] to open the file menu; text will appear at the cursor position.
From there, select a menu option using the left-right arrow keys and [2nd] or [trace].
Each item in this menu does something different.

<new> create a new file
This will show a second menu. From there, input a file type then a name for the file.
<open> open the file, which is hovered over by the cursor
<edit> edit the file, which is hovered over by the cursor
<copy> Copy file
<paste> Paste file
Prompts for a file name. (pasted file name) If the name contains nothing, it will paste the file with the same name as before.
<delete> Delete file (will delete from the calculator)
<cut> Cut file, which is hovered over by the cursor
<import> Add file to filesystem
Prompts for a file name (file to import)
<remove> Remove selected file from the filesystem
NOTE: This does not delete nor hide the file from the calculator
<rename> Rename file
Prompts for a file name (new name)
<info> Show file info

Left-click on the icon in the bottom-left corner of the screen, and the version info will appear. (the [y=] key does the same thing)
Right-click on that icon to open the settings menu.

Click on the double left/right arrows at the bottom of the screen (or use [window]/[zoom] keys) to change the current box number.

Left-click on a file on the desktop and it will take you to its associated editor program.
If it prompts: "With?", Input the name of the program/appvar of the editor program that you would like to associate with this type of file.
Next input whether it is an appvar, program, or protected program.
Finally, open the file again, and it will take you to the editor that you had selected.

Press [apps] to bring up a list of all the file associations.
If it doesn't this means that you do not have any file associations.
Once in the menu, you can scroll the list with the up and down arrow keys.
Pressing [del] will remove the currently selected file association.

Press [prgm] to run a program. It will prompt for a name, then a variable type.


IMPORTANT NOTE ON USER INPUT:
Pressing [clear] at any time while inputting anything will cancel the operation

SETTINGS MENU:
<backgd> set background color
<text A> set text color A; used for non-inverted text
<text B> set text color B; used for inverted text background
<text C> set text color C; used for inverted text foreground


TEXT INPUT:
Press [alpha] or [2nd] to switch overtypes
Under the "A" or "a" overtype, use the keys with the green letters above them to put letters
Under the "1" overtype, use the number keys to enter numbers.
See "keymap.txt" for more details.


EDITORS INCLUDED: (Extension, VarName, VarType)
".ximg", "BOSximgE", appvar
".xgif", "BOSxgifV", appvar
See their individual READMEs for details

NOTES:
To move a file between boxes, use the cut function and paste the file in another box.
See the BOSshell website for developers information.
There is a bug with removing files, where the shell will occasionally forget to remove it from the filesystem.
I hope to be able to fix this soon, but it is a harmless bug at this time.


WEBSITE:
https://beckadamtheinventor.github.io/BOSshellCE/


CHANGELOG:
-4.5.2: pre-release
-4.10.0: first full release
--Added Asm subprogram running for file associations.
--Added more shortcut keys
--Many small bugfixes
-4.10.2: Second release
--Added running programs from the shell without opening them within the shell
--Added file association management
--Added xgif viewer
--Fixed the BOSshell website
--Made this README more clear and added READMEs for editors
-4.10.3: Second release (hotfix)
--Fixed text overflowing the screen and occasionaly crashing
--Made text overtype persist between inputs

