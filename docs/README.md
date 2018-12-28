BOSshell version 4.10.0 for TI-84+CE
by beckadamtheinventor


ABOUT:
BOSshell stands for Beck's Operational shell. This shell can be used for a number of different file making and processing programs.
It currently only uses appvars for files; however, these appvars can have specific file types, in a system that is entirely seperate from the variable type.
This shell is still very much still in development, despite this being the first full release.
If you do encounter a bug or crash, please report it to me on the Cemetech.net forums


CREDITS:
Thank you to all the folks at Cemetech!
Special thanks to LAX18 and jcgter777 for their ongoing support! (and reminding me to work on this)
Special thanks to MateoC for his patience in teaching me eZ80 Assembly!
Another special thanks to KermPHD, for Doors, the inspiration for BOSshell!
Seriously, thank you all! :)
-beckadamtheinventor


INSTALLATION:
Send "BOSSHELL.8xp" and "BOSdata.8xv" to your CE using TI-Connect or TILP. Select the program from the [prgm] list, then press [enter] to run it.
The shell will load momentarily! :D


USAGE:
When the desktop appears, there will be a cursor, which you can move around with the arrow keys.
Holding the arrow keys or pressing them repeatedly will speed up the cursor.
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


SETTINGS MENU:
<backgd> set background color
<text A> set text color A; used for non-inverted text
<text B> set text color B; used for inverted text background
<text C> set text color C; used for inverted text foreground


TEXT INPUT:
Press [alpha] or [2nd] to switch overtypes


EDITORS INCLUDED:
There is a ".ximg" editor included in this release.
When opening a file of this type, and it prompts: "with?", input "BOSximgE" then select "appvar".


NOTES:
To move a file between boxes, use the cut function and paste the file in another box.
See the BOSshell website for developers information


CHANGELOG:
-4.5.2: pre-release
-4.10.0: first full release
--Added Asm subprogram running for file associations.
--Added more shortcut keys
--Many small bugfixes
