; Recursive C procedure
; lets suppose following procedure that calls itself
; int fact(int n){
;  if(n<1) return 1;
;  return (n * fact(n-1));
; }
; Here, register x2 is stack pointer.x1 holds return address and x10 holds function argument and return value
fact: ; label of the procedure
addi x2, x2, -8 ; grow the stack to hold 2 values
lw x1, 4(x2) ; push return address to the stack
lw x10, 0(x2) ; push argument n to the stack 
addi, x3, x10, -1 ; calculate n-1
bge x3, x0,L1 ; goto label L1 if n-1 >= 0 which is same as n>=1
addi x10,x0,1 ; otherwise, put 1 to return value
addi x2, x2, 8 ; shrink the stack to its original size.
jalr x0,0(x1); return to caller

L1:
addi x10, x0, x3 ; put n-1 located in x3 to argument register x10
jal x1, fact ; call fact with n-1 argument keeping return address same
addi x4, x0, x10 ; copy result of fact(n-1) from x10 to x4
lw x10, 0(x2) ; pop argument n into register x10
lw x10, 4(x2) ; pop return address into register x1
mul x10, x10, x4; calculate n * fact(n-1)   
jalr x0, 0(x1) ; return to caller
