; strcpy function that copies contents of string y to x.
; void strcpy(char x[],char y[]){
;  size_t i = 0;
;  while ((x[i] = y[i]) != '\0')
;    i++;
; }
; assume base addresses of arrays x and y are in registers x10 and x11 respectively.
; Also assume variable i is stored in x5
strcpy:
addi x2, x2, -4   ; grow stack to store 1 item
sw x5, 0(x2)      ; push value of x5 into the stack
add x5, x0, x0    ; i=0
LOOP:
add x6, x11, x5   ; x6 contains address of value at y[i]
lbu x7, 0(x6)      ; x7 loads value at y[i]
add x6, x10, x5   ; x6 contains address of value at x[i]
sb x7, 0(x6)      ; x[i] = y[i]
beq x7, x0, L1    ; goto L1 if x7=0 i.e null character
addi x5, x5, 1    ; i=i+1
jal x1, LOOP      ; goto LOOP 
L1:
lw x5, 0(x2)      ; pop and restore back previous value of x5
addi x2, x2, 4    ; shrink back stack to its original size
jalr x0,0(x1)     ; return to caller 
