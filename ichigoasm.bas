!!

Demonstrates the Select Command

!!

! Load an array with the names of the asmcom

ARRAY.LOAD asmcom$[], "Rd = u8", "Rd = Rm"~
 "Rd = Rd + u8", "Rd = Rd - u8", "Rd = Rm << u5"~
 "Rd = Rm >> u5", "Rd = Rn + Rm"~
 "Rd = Rn - Rm", "Rd = Rn + u3", "Rd = Rn - u3"~
 "Rd = Rd & Rm", "Rd = Rd ^ Rm", "Rd = Rd << Rs"~
 "Rd = Rd >> Rs", "Rd = -Rm", "Rd = Rd | Rm"~
 "Rd = Rd * Rm", "Rd = Rd & ~Rm", "Rd = ~Rm"~
 "Rd = rev(Rm)", "Rd = rev16(Rm)", "Rd = revSH(Rm)"~
 "Rd = [Rn + u5]", "Rd = [Rn + u5]2", "Rd = [Rn + u5]4"~
 "[Rn + u5] = Rd", "[Rn + u5]2 = Rd", "[Rn + u5]4 = Rd"~
 "Rd = [Rn + Rm]", "Rd = [Rn + Rm]2", "Rd = [Rn + Rm]4"~
 "[Rn + Rm] = Rd", "[Rn + Rm]2 = Rd", "[Rn + Rm]4 = Rd"~
 "Rn - u8", "Rn - Rm", "Rn & Rm"~
 "IF 0 GOTO n8 << 1", "IF !0 GOTO n8 << 1"~
 "GOTO n11 << 1", "GOTO Rd", "RET (=#4770)","CALL Rd"~
 "PUSH regs", "POP regs", "CPSID (=#B672)"~
 "CPSIE (=#B662)", "WFI (=#BF30)", "NOP (=0)"

! Load an array with the names of the asmbin

ARRAY.LOAD asmbin$[], "00100", "0100011000"~
 "00110", "00111", "00000"~
 "00001", "0001100"~
 "0001101", "0001110", "0001111"~
 "0100000000", "0100000001", "0100000010"~
 "0100000011", "0100001001", "0100001100"~
 "0100001101", "0100001110", "0100001111"~
 "1011101000", "1011101001", "1011101011"~
 "01111", "10001", "01101"~
 "01110", "10000", "01100"~
 "0101110", "0101101", "0101100"~
 "0101010", "0101001", "0101000"~
 "00101", "0100001010", "0100001000"~
 "11010000", "11010001"~
 "11100", "010001110", "0100011101110000","010001111"~
 "1011010", "1011110", "1011011001110010"~
 "1011011001100010", "1011111100110000", "0000000000000000"
  
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
 PRINT "You selected nothing."
ELSE
 PRINT "You selected ";
 PRINT asmcom$[asm];":";asmbin[asm]
ENDIF



