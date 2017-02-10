!!

Demonstrates the Select Command

!!

! Load an array with the names of the asmcom

Top:

ARRAY.LOAD asmcom$[], "Rd=u8", "Rd=Rm"~
 "Rd=Rd+u8", "Rd=Rd-u8", "Rd=Rm<<u5"~
 "Rd=Rm>>u5", "Rd=Rn+Rm"~
 "Rd=Rn-Rm", "Rd=Rn+u3", "Rd=Rn-u3"~
 "Rd=Rd&Rm", "Rd=Rd^Rm", "Rd=Rd<<Rs"~
 "Rd=Rd>>Rs", "Rd=-Rm", "Rd=Rd|Rm"~
 "Rd=Rd*Rm", "Rd=Rd&~Rm", "Rd=~Rm"~
 "Rd=rev(Rm)", "Rd=rev16(Rm)", "Rd=revSH(Rm)"~
 "Rd=[Rn+u5]", "Rd=[Rn+u5]2", "Rd=[Rn+u5]4"~
 "[Rn+u5]=Rd", "[Rn+u5]2=Rd", "[Rn+u5]4=Rd"~
 "Rd=[Rn+Rm]", "Rd=[Rn+Rm]2", "Rd=[Rn+Rm]4"~
 "[Rn+Rm]=Rd", "[Rn+Rm]2=Rd", "[Rn+Rm]4=Rd"~
 "Rn-u8", "Rn-Rm", "Rn&Rm"~
 "IF 0 GOTO n8 << 1", "IF !0 GOTO n8 << 1"~
 "GOTO n11 << 1", "GOTO Rd", "RET (=#4770)","CALL Rd"~
 "PUSH regs", "POP regs", "CPSID (=#B672)"~
 "CPSIE (=#B662)", "WFI (=#BF30)", "NOP (=0)"

! Load an array with the names of the asmbin

ARRAY.LOAD asmbin[], bin("00100"), bin("0100011000")~
 bin("00110"), bin("00111"), bin("00000")~
 bin("00001"), bin("0001100")~
 bin("0001101"), bin("0001110"), bin("0001111")~
 bin("0100000000"), bin("0100000001"), bin("0100000010")~
 bin("0100000011"), bin("0100001001"), bin("0100001100")~
 bin("0100001101"), bin("0100001110"), bin("0100001111")~
 bin("1011101000"), bin("1011101001"), bin("1011101011")~
 bin("01111"), bin("10001"), bin("01101")~
 bin("01110"), bin("10000"), bin("01100")~
 bin("0101110"), bin("0101101"), bin("0101100")~
 bin("0101010"), bin("0101001"), bin("0101000")~
 bin("00101"), bin("0100001010"), bin("0100001000")~
 bin("11010000"), bin("11010001")~
 bin("11100"), bin("010001110"), bin("0100011101110000"), bin("010001111")~
 bin("1011010"), bin("1011110"), bin("1011011001110010")~
 bin("1011011001100010"), bin("1011111100110000"), bin("0000000000000000")


!ARRAY.LOAD rd[], 0,1,2,3
!ARRAY.LOAD rm[], 0,1,2,3
!ARRAY.LOAD rn[], 0,1,2,3
!ARRAY.LOAD rs[], 0,1,2,3


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

!print asm

!stop


IF asm = 0
 PRINT "You selected nothing."
ELSE
 SW.BEGIN asm
  SW.CASE 2,11,12,15,16,17,18,19,20,21,22
   input asmcom$[asm]+":"+"Rm",rm
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-6)+shift(rm,-3)+rd
   SW.break
  SW.CASE 13,14
   input asmcom$[asm]+":"+"Rs",rs
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-6)+shift(rs,-3)+rd
   SW.break
  SW.CASE 36,37
   input asmcom$[asm]+":"+"Rm",rm
   input asmcom$[asm]+":"+"Rn",rn
   asmbin[asm]=shift(asmbin[asm],-6)+shift(rm,-3)+rn
   SW.break
  SW.CASE 7,8,29,30,31,32,33,34
   input asmcom$[asm]+":"+"Rm",rm
   input asmcom$[asm]+":"+"Rn",rn
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-9)+shift(rm,-6)+shift(rn,-3)+rd
   SW.break
  SW.CASE 9,10
   input asmcom$[asm]+":"+"u3",u3
   input asmcom$[asm]+":"+"Rn",rn
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-9)+shift(u3,-6)+shift(rn,-3)+rd
   SW.break
  SW.CASE 1,3,4
   input asmcom$[asm]+":"+"Rd",rd
   input asmcom$[asm]+":"+"u8",u8
   asmbin[asm]=shift(asmbin[asm],-11)+shift(rd,-8)+u8
   SW.break
  SW.CASE 5,6
   input asmcom$[asm]+":"+"u5",u5
   input asmcom$[asm]+":"+"Rm",rm
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-11)+shift(u5,-6)+shift(rm,-3)+rd
   SW.break
  SW.CASE 35
   input asmcom$[asm]+":"+"Rn",rn
   input asmcom$[asm]+":"+"u8",u8
   asmbin[asm]=shift(asmbin[asm],-11)+shift(rn,-8)+u8
   SW.break
  SW.CASE 23,26
   input asmcom$[asm]+":"+"u5",u5
   input asmcom$[asm]+":"+"Rn",rn
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-11)+shift(u5,-6)+shift(rn,-3)+rd
   SW.break
  SW.CASE 24,27
   input asmcom$[asm]+":"+"u5",u5
   input asmcom$[asm]+":"+"Rn",rn
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-11)+shift(u5/2,-6)+shift(rn,-3)+rd
   SW.break
  SW.CASE 25,28
   input asmcom$[asm]+":"+"u5",u5
   input asmcom$[asm]+":"+"Rn",rn
   input asmcom$[asm]+":"+"Rd",rd
   asmbin[asm]=shift(asmbin[asm],-11)+shift(u5/4,-6)+shift(rn,-3)+rd
   SW.break
  SW.CASE 38,39
   input asmcom$[asm]+":"+"n8",n8
   if n8<0 then n8=256+n8
   asmbin[asm]=shift(asmbin[asm],-8)+n8
   SW.break
  SW.CASE 40
   input asmcom$[asm]+":"+"n11",n11
   asmbin[asm]=shift(asmbin[asm],-11)+n11
   SW.break
  SW.CASE 41,43
   input asmcom$[asm]+":"+"Rm",rm
   asmbin[asm]=shift(asmbin[asm],-7)+shift(rm,-3)
   SW.break
  SW.CASE 44
   input asmcom$[asm]+":"+"LR",lr
   input asmcom$[asm]+":"+"R8",r8
   asmbin[asm]=shift(asmbin[asm],-9)+shift(lr,-8)+r8
   SW.break
  SW.CASE 45
   input asmcom$[asm]+":"+"PC",pc
   input asmcom$[asm]+":"+"R8",r8
   asmbin[asm]=shift(asmbin[asm],-9)+shift(pc,-8)+r8
   SW.break
  SW.CASE 42,46,47,48,49
   SW.break
 SW.END
 
 print ":";using$("","%4s",hex$(asmbin[asm]));
 print ":";using$("","%16s",bin$(asmbin[asm]));
 print ":";asmcom$[asm]
ENDIF
if asm=49 then goto End

goto Top

End:
