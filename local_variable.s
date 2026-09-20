# int func() {
#         int value;
#         get_value(&value);
#         retutrn value;
# }

func:
addi,sp,sp,-4 # allocate 4bytes for a 32bit int
la a0,(sp) # pass address of value as parameter
call get_value
lw a0,(sp)  # return value
addi sp,sp,4 # deallocate stack
ret
