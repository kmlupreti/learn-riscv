; g= h + A[8]
; where, A[8] is the value stored at 8th index of Array A
; It looks like a single operation but we need to first load value of A[8] from the memory
; before performing addition

;load value at 8th index of  an array whose base address is stored in register x1
lw x2,8(x1)

; add value stored at x3 and x2 and save it to register x4.Here, let  g and h be stored in registers x4 and x3 
add x4, x3, x2
