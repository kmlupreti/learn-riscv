; sort function using bubble sort metho
; void sort(int v[], size_t n){
;   size_t i,j;
;   for (i=0;i<n;i++) {
;    for (j=i-1;j>=0 && v[j]>v[j+1]; j--) {
;     swap(v,j); // swaps elements v[j] and v[j+1]
;     }
;   }
; }
; 
sort:
        addi x2, x2, -20; adjust stack pointer to hold 5 values
        sw x1, 16(x2) ; save return address
        sw x18, 12(x2) ; save x18
        sw x19, 8(x2) ; save x19
        addi x5,x0,0 ; i=0
        outer_loop:
                bge x5, x11, exit ; exit outer loop if i>=n 
                addi x6, x5, -1 ; j=i-1
                inner_loop:
                        slli x18, x6, 2 ; x18=j*4 (change jth word index to byte index)
                        add x18, x10, x11 ; x18=address of v[j]
                        addi x19, x18, 4 ; x19=address of v[j+1] 
                        lw x18, 0(x18) ; x18=value of v[j]
                        lw x19, 0(x19) ; x19=value of v[j+1]
                        blt x6, x0, exit_inner ; exit inner loop if j<0
                        blt x18, x19, exit_inner ; exit inner loop if v[j]<v[j+1]
                        sw x11, 4(x2) ; save 1st argument i.e base address of v 
                        sw x11, 0(x2) ; save 2nd argument n
                        addi x11, x6, 0 ; place index j as 2nd argument
                        jal x0, swap ; call swap(v,j) 
                        lw x11, 0(x2) ; restore 2nd argument
                        lw x10, 4(x2) ; restore 1st argument
                        addi x6, x6, -1 ; j=j-1
                        beq x0, x0, inner_loop ; goto next iteration of inner loop
                exit_inner:
                addi x5, x5, 1 ; i=i+1
                beq x0,x0, outer_loop ; goto next iteration of outer loop
        exit:
        lw x1, 16(x2) ; restore return address
        lw x18, 12(x2) ; restore x18
        lw x19, 8(x2) ; restore x19
        addi x2, x2, 20 ; restore stack size
        jal x0, 0(x1) ; return to caller

