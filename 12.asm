; atomically exchange value between register and memory
; suppose we want to atomically swap values between register x22 and memory location
; at address stored in register x20
L1:
;use load reserved word instruction to load value at address x20 into register x5
lr.w x5, (x20)  
; use store conditional instruction to store value at register x22 to address stored at x20
; This operation only occurs if register x4 which acts as a lock variable is free(0) and fails
; if lock is unavailable(1)
sc.w x4, x22, (x20)
; do not contine the swap and try again if the store was unsucessful
bne x4, x0, L1
; copy the value loaded from memory into register x22
addi x22, x5, x0

; if the processer context switch or intervenes and modifies value in memory between operations
; lr.w and sc.w then lock variable is set to non-zero value thus indicating it was unable to
; perform atomic swap which causes it to try again.
