; sort function using bubble sort method
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
        addi x2, x2, 8 ; adjust stack pointer to hold 3 values
        sw x1, 4(x2) ; save return address
        addi x5,x0,0 ; i=0
        outer_loop:
                bge x5, x11, exit ; exit outer loop if i>=n 
                addi x6, x5, -1 ; j=i-1
                inner_loop:
                        slli x30, x6, 2 ; x30 = j * 4 (change jth word index to byte index)
                        add x30, x10, x11 ; x30= address of v[j]
                        addi x31, x30, 4 ; x31= address of v[j+1] 
                        lw x30, 0(x30) ; x30= value of v[j]
                        lw x31, 0(x31) ; x31= value of v[j+1]
                        blt x6, x0, exit_inner ; exit inner loop if j<0
                        blt x30, x31, exit_inner ; exit inner loop if v[j]<v[j+1]
                        sw x11, 0(x2) ; save 2nd argument n 
                        addi x11, x6, 0 ; place index j as 2nd argument
                        jal x0, swap ; call swap(v,j) 
                        lw x11, 0(x2) ; restore value of n
                        addi x6, x6, -1 ; j=j-1
                        beq x0, x0, inner_loop ; goto next iteration of inner loop
                exit_inner:
                addi x5, x5, 1 ; i=i+1
                beq x0,x0, outer_loop ; goto next iteration of outer loop
        exit_outer:
