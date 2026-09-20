# int fact(int n) {
#         if (n>1) return n * fact(n-1);
#         else return 1;
# }
#

# lets pass number whose factorial is to be calculated. The result is also saved in same register
	li a0,4
fact:
        addi sp,sp,-16 # allocate stack frame for fact routine. it should be multiple of 16 as per ilp ABI
        sw ra, 0(sp) # save return address of current fact routine
        li t0,1
        ble a0,t0,else # if n<=1 goto else
        sw a0,4(sp) # save current value of n in the stack 
        addi a0,a0,-1 # a0 = n--
        call fact # call fact(n-1)
        lw t0, 4(sp) # restore previous value of n
        mul a0,t0,a0 # n * fact(n-1)
        j end# goto end
else:
        li a0,1
end:
        lw ra,0(sp) # restore return address
        addi sp,sp,16 # restore stack frame
        ret
