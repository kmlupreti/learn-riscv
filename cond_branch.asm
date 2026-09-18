; conditional branching
; For eg. we have following C statements
; if( a == b) then c = d+e else c =d-e
; Here, a,b,c,d and e are variables
; location pointed by its label
; let the variables be stored in registers as follows:
; a = x1, b = x2, c = x3, d = x4 and e = x5
; Following are two implemenations of same program using different instructions 

; using beq( branch if equal)
; it goes to specified label if two registers are equal.
; otherwise, it executes the next instruction
; Here x1 and x2 are registers being checked and ADD is the label
; of the location where addition is performed
beq x1,x2,ADD
sub x3, x4, x5
; we need to exit directly from here without executing next instructions
; for that we need to unconditional branch which always follows the branch
; i.e the condition is always true
beq x0,x0,EXIT
ADD:
add x3, x4, x5
EXIT:

; using bne( branch if not equal)
; it goes to specified label if two registers are not equal.
; otherwise, it executes the next instruction
; Here x1 and x2 are registers being checked and SUB is the label
; of the location where subtraction is performed
bne x1,x2,SUB
add x3, x4, x5
; we need to exit directly from here without executing next instructions
; for that we need to unconditional branch which always follows the branch
; i.e the condition is always true
beq x0,x0,EXIT
SUB:
sub x3, x4, x5
EXIT:
