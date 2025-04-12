;logical operations

; shift left logical
; for eg.  x1 = x2 << x3
; if x2 = 1011 and x3= 11 then x1 = 1011000
sll x1, x2, x

; shift left logical immediate
; same as before but how much to be shifted is provided directly
; for eg.  x1 = x2 << 3
; if x2 = 1011 then x1 = 1011000
slli x1, x2, 3

; shift right logical
; for eg.  x1 = x2 >> x3
; if x2 = 1011001 and x3= 11 then x1 = 1011
srl x1, x2, x3

; shift right logical immediate
; same as before but how much to be shifted is provided directly
; for eg.  x1 = x2 >> 3
; if x2 = 1011001 then x1 = 1011
srli x1, x2, 3

; shift right arithmetic
; Unlike logical shift, it fills the empty bits with its original sign bit
; for eg.  x1 = x2 >> x3
; if x2 = 111..111100011001 and x3= 11 then x1 = 11..1111110001
srl x1, x2, x3

; shift right arithmetic
; Unlike logical shift, it fills the vacated bits with sign bit
; for eg.  x1 = x2 >> x3
; if x2 = 111..111100011001 and x3= 11 then x1 = 11..1111110001
sra x1, x2, x3

; shift right arithmetic
; same as before but how much to be shifted is provided directly
; for eg.  x1 = x2 >> 3
; if x2 = 111..111100011001 then x1 = 11..1111110001
srai x1, x2, 3

; logical AND operator
; it performs bit by bit AND operation such that if bit value
; of both operands is 1 then only it will give 1
; for eg. x1 = x2 & x3
; if x2= 101001 and x3 = 111010 then x3= 101000
and x1, x2, x3
; using immediate value
andi x1, x2, 58

; logical OR operator
; it performs bit by bit OR operation such that if bit value
; of any operand is 1 then only it will give 1
; for eg. x1 = x2 | x3
; if x2= 101001 and x3 = 111010 then x3= 111011
or x1, x2, x3
; using immediate value
ori x1, x2, 58

; logical XOR operator
; it performs bit by bit XOR operation such that if bit value
; of any operand is different then only it will give 1
; for eg. x1 = x2 ^ x3
; if x2= 101001 and x3 = 111010 then x3= 010011
xor x1, x2, x3
; using immediate value
xori x1, x2, 58

; logical NOT operator
; it performs bit by bit NOT operation such that it reverses the bit value
; It normally takes single operand but in risc-v NOT operation is achieved by
; carrying out XOR operation(xori) with number having all 32 bit values 1
; for eg. x1 = ~x2 
; if x2= 101001 then x1= 010110
xori x1, x2, 4294967295
