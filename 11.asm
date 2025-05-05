; loading 32 bit constant
; since addi only allows 12 bit constant
; we need a different approach in order to get constant value greater than 12 bit
; for this we can use lui (load upper immediate) instruction to load upper 20 bits from 12 to 31
; into a register and then we can add lower 12 bits using addi
; for example lets load constant 00000000 10111010 11000101 00101001 i.e 12240169 into register x5

lui x5, 2988 ; ;load bits 12-31 i.e 00000000 10111010 1100 into register x5
addi x5,1321 ; add lower bits 0-11 i.e 010100101001 to register x5 to get desired constant 

; now the register x5 contains constant 12240169
