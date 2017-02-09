!!

Demonstrates the Select Command

!!

! Load an array with the names of the asmcom

ARRAY.LOAD asmcom$[], "Rd = u8", "Rd = rm"~
"Rd = Rd + u8", "Rd = Rd - u8", "Rd = Rm << u5",~
"Rd = Rm >> u5", "Rd =Rn + Rm","Rd = Rd + Rm"~
"Rd = Rn - Rm", "Rd = Rn + u3", "Rd = Rn - u3"~
"Rd = Rd & Rm","Rd = Rd ^ Rm","Rd = Rd << Rs"~
"Rd = Rd >> Rs","Rd = -Rm","Rd = Rd | Rm"~
"Rd = Rd * Rm","Rd = Rd & ~Rm","Rd = ~Rm"~
"Rd = rev(Rm)","Rd = rev16(Rm)"~
"Rd = revSH(Rm)","Rd = [Rn + u5]"~
"Rd = [Rn + u5]2","Rd = [Rn + u5]4"~
"[Rn + u5] = Rd","[Rn + u5]2 = Rd","[Rn + u5]4  = Rd"~
"[Rn + u5] = Rd","[Rn + u5]2 = Rd","[Rn + u5]4  = Rd"~





"",""


DIALOG.MESSAGE ,"Use SELECT or DIALOG.SELECT?", b, "DIALOG.SELECT", "SELECT"

! Set the Popup Message

msg$ ="Select the asm command."

! Shows the list and waits for the user
! to make the selection.

IF b = 2  % user chose SELECT
SELECT asm, asmcom$[], msg$
ELSE      % chose DIALOG or did not choose
DIALOG.SELECT asm, asmcom$[], msg$
ENDIF

! if the selection was zero, the user hit the
! BACK key

IF asm = 0
 PRINT "You are unborn"
ELSE
 PRINT "You were born in ";
 PRINT asmcom$[asm]
ENDIF

