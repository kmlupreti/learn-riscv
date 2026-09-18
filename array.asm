; A[12] = h + A[8]
; Here A is an array of words in the memory and h is value in register x21
; It looks like a single operation but we need to transfer
; value at A[8] to register as we can't perform arithmetic
; operations directly on the values stored in the memory

; load data from memory to a register.
; The base address is stored in register x22.
; The offset n points to the nth byte so the required
; offset to get 8th word is 4x8 i.e 32 as 1 word = 4 bytes
lw x23, 32(x22)

; add h stored in register x21 with value of A[8] stored in register x23 and
; store it back to register x21
add x21, x21, x23

; store the result of the sum from register x21 to memory
sw x21, 48(x22)
