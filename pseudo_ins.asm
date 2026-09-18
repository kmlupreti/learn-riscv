; pseudoinstructions are the simplified instructions provided by the assembler for carrying out
; certain tasks more conviniently. These are not not implemented on hardware. They just provide
; single instruction instead of using several actual instructions to do something.
; Following are some of the pseudoinstructions and the equivalent instructions to which assembler transforms them

; load immediate value 36 into register x22
; equivalent : addi x22, x0, 36
li x22, 36

; copy the value from register x22 to x23
; equivalent : addi x23, x22, 0
mv x23, x22

; and instruction can be used instead of andi for immediate values too
; equivalent: andi x22, x23, 15
and x22, x23, 15
