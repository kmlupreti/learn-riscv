.globl main ; export main function

; store 5 word(32 bit) values in data section
.data
numbers:
 .word 15
 .word 10
 .word 7
 .word 10
 .word 55


.text
get_largest_number:
 la a0,numbers ; a0 = &numbers
 li t0,0 ;  i=0
 li t1,5  ; max value of i
 lw a1,(numbers) ; set largest = numbers[0]
loop:
 bge t0,t1,done  ; if i >=10 done
 slli t2,t0,2 ; t2= i*4
 add t2,a0,t2 ; t2 == &numbers + i*4
 lw t2,(t2)  ; t2= numbers[i]
 blt t2,t1,done ; skip if current is smaller
 mv a1,t2 ; greater number found 
 addi t0,t0,1 ; i++
 j loop ; loop again
done:
 mv a0,a1 ; copy result to a0
 ret

main:
 j get_largest_number


  
 
