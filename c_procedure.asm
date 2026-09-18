; C procedure that doesn't call another procedure
; lets suppose following C procedure
; int calculate(int a, int b, int c,int d){
;   int result = (a+b)-(c+d);
;   return result;
; }
; The parameters and return values are stored in 8 parameter registers (x10-x17)
; Here, parameters a,b, c and d are stored in registers x10, x11, x12 and x13.
; Also result should be put on x10 register for returning 

; assembly program starts with the label which is same the function name.
calulate:
 
; The first step is to save the current values of the registers that we are going
; to use in the stack so that the original values will be restored after
; the control goes back to the caller of the procedure. The stack grows from higher memory address
; to lower memory address. So we need to subtract from stack pointer(sp) i.e x2 to grow the stack and
; similary add to it to shrink it. 
 
; Adjust stack to hold 3 registers i.e x20,x21 and x22 which are used in the procedure below
; It is subtracted by 12=3x4 to grow the stack to hold 3 words which are of 4 bytes each
addi sp, sp, -12

;save registers
sw x20, 8(sp) 
sw x21, 4(sp) 
sw x22, 0(sp) 

;carry out procedure
add x20, x10, x11
add x21, x12, x13
sub x22, x20, x21

; put the result in parameter register to return it to the caller
addi x10, x22, 0

;restore the original values in the registers
lw x22, 0(sp)
lw x21, 4(sp)
lw x20, 8(sp)

;shrink the stack to its original size
addi sp, sp, 12

; return the control back to caller at its return address stored in x1
jalr x0, 0(x1)
