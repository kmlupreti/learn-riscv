; while (save[i]== k)
;  i++;

; assume value of variable i and k be stored in x20 and x21
; Also base address of save be stored in x22
loop:
slli x5, x20, 2 ; multiply i by 4 to get proper word index and store in x5
add x6, x22, x5 ; add base address of save and word index of i to get address of ith word and store in x6
lw x6, 0(x6) ; load ith word pointed by address stored in x6 and store in x6
bne x6, x21, exit; exit loop aif save[i]!=k
addi x20, x20, 1 ; i++
jal x0, loop ; goto loop
exit:
