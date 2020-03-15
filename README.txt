BOSshell version 4.11.0 for the TI-84+CE family
Adam "beckadamtheinventor" Beckingham

LICENSED UNDER GPL3.


ABOUT:
BOSshell stands for Beck's Operational shell. This shell can be used for a number of different file making and processing programs.
This shell supports standard Asm headers, as well as it's own file typing system.
If you do encounter a bug or crash, please report it to me on the dev thread at https://www.cemetech.net/
link: https://www.cemetech.net/forum/viewtopic.php?t=14263


CREDITS:
Thank you to all the folks at Cemetech!
Special thanks to LAX18 and jcgter777 for their ongoing support! (and reminding me to work on this)
Special thanks to all the assembly experts on Cemetech for their patience in teaching me eZ80 Assembly,
and numerous other things that were instrumental in my creation of this shell!
And a very special thanks to KermPHD, for Doors, the inspiration for BOSshell!
Seriously, thank you all! :)
-beckadamtheinventor


INSTALLATION:
Transfer "OOBE.8xg" to the calculator. (ex. TI-Connect, TILP)
Select "BOSSHELL" from the [prgm] list, then press [enter] to run it.
The shell will load momentarily! :D



USAGE:
When the desktop appears, there will be a cursor, which you can move around with the arrow keys.
Pressing [clear] will exit the shell.
Right-click with [alpha] or [graph] to open the file menu; text will appear in the top left corner.
From there, select a menu option using the left-right arrow keys and [2nd] or [trace].
Each item in this menu does something different.

<new>    create a new file
         This will show a second menu. From there, input a file type then a name for the file.
<open>   open the file, which is hovered over by the cursor
<edit>   edit the file, which is hovered over by the cursor
<copy>   Add file to copy/cut buffer, to be copy->pasted
<paste>  Paste file from copy/cut buffer
         Prompts for a file name. (pasted file name) If the name contains nothing, it will paste the file with the same name as before.
<delete> Delete file (will delete from the calculator)
<cut>    Add file to copy/cut buffer, to be cut->pasted
<import> Add file to filesystem
         Prompts for a file name (file to import)
<remove> Remove selected file from the filesystem
         NOTE: This does not delete nor hide the file from the calculator
<rename> Rename file
         Prompts for a file name (new name)
<info>   Show file info

There is also a secondary menu, opened by pressing [math]:
<open with>  Select a file association to open the selected file with
<edit with>  Select a file association to edit the selected file with
<Run prgm>   Attempt to execute the selected program. This executes it as TI-BASIC if it is not a valid Asm file.


Left-click on the icon in the bottom-left corner of the screen, and the version info will appear.
Right-click on that icon to open the settings menu.

Click on the double left/right arrows at the bottom of the screen (or use [window]/[zoom] keys) to change the current box number.

Left-click on a file on the desktop and it will take you to its associated editor program.
If it prompts: "File Assoc?", Input the name of the program/appvar of the editor program that you would like to associate with this type of file, then input whether it is an appvar or program.
The shell will then open in the editor that you had selected, and remember your choice.

Press [apps] to bring up a list of all the file associations.
If it doesn't this means that you do not have any file associations.
Once in the menu, you can scroll the list with the up and down arrow keys.
Pressing [del] will remove the currently selected file association.
Pressing [+] will allow you to add a new file association.

Press [prgm] to run a program. It will prompt for a name, then a variable type.



NOTE ON USER INPUT:
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


WEBSITE:
https://beckadamtheinventor.github.io/BOSshellCE/


CHANGELOG:
-4.5.2: pre-release
-4.10.0: first full release
--Added Asm subprogram running for file associations.
--Added more shortcut keys
--Many small bugfixes
-4.10.2: Second release
--Added running programs from the shell without opening them via a file association
--Added file association management
--Added xgif viewer
--Fixed the BOSshell website
--Made this README more clear and added READMEs for editors
-4.10.3: Second release (hotfix)
--Fixed text overflowing the screen and occasionaly crashing
--Made text overtype persist between inputs
-4.10.5: Second release (hotfix 2)
--Fixed files not being removed from the desktop
--Added running asm programs from appvars imported to the desktop
--Fixed asm appvars on the desktop displaying non-printable characters
--Added a program to copy asm programs to appvars
-4.10.6: Third release
--Made cursor move faster
--Allowed pressing of multiple arrow keys to move the cursor
--Added popup when saving in the ximg editor, to confirm that, yes, you did save.
-4.10.9: (Unreleased)
--Fix BOSptoav.8xv input showing corrupted text
--Fix filesystem bugs
--Fix program execution instability, all programs should now run without crashing
--Add ability to add new file associations without making a new file
--Add file detection on first startup
--Add icon, description, and type for assembly/ICE/C programs
-4.11.0: Release 4
--Programs can now be imported into the filesystem
--Attempt to execute files even if they are not recognized
--"Open/Edit with" will now open file associations menu
--Speed improvements
--Bugs squashed
--Slowed down cursor, was way to fast before
--More efficient code and code size


