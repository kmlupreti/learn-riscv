; implementing simple while loop using conditional branching
; Lets suppose following C statements
; while ( Nums[i] = j) i+=1;
; Let the variables i and j be stored in registers
; x1 and x2. Also let base address of array Nums be stored
; in register x3. START and END are the labels defined by us for jumping
START:
slli x10, x1, 2; shift word index by 2 which is equivalent to multiplying by 2^2 i.e 4  to get proper byte address index and store in temp register x10
add x10,x10,x3 ; add base address and word index to get proper address of the word pointed by given index
lw x4, 0(x10) ; load value at Nums[i] such that x10 contains address of word
bne x2, x4,END ; goto END if Nums[i] != j
add x1, x1, 1 ; increment i by 1
beq x0,x0,START ; jump to next iteration of the loop
END:
