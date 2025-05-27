; exercise 2.3
; i = x28, j = x29
; base address of A = x10 and B = x11
; B[8] = A[i-j]
add x5, x10, 32 ; x5 = address of B[8] = base address of B + 8 * 4
sub x6, x28, x29 ; x6 = i - j
slli x6, x6, 2 ; x6 = x6 * 4 i.e word index of A[i-j] 
add x6, x6, x11 ; x6 = address of A[i-j]
lw x6, 0(x6) ; x6 = value stored at A[i-j]
sw x6, 0(x5) ; copy value of B[8] stored in x6 to address of A[i-j] stored in x5
