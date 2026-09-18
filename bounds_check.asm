; bounds check shortcut
; we can used unsigned comparision on signed numbers
; to check where they are < or >= as well if the the number is
; a negative number. It works because the negative integers having
; 1 in sign bit looks like large number when its treated as an unsigned integer

;goto L1 if x1>=x2 or x1 is -ve
bgeu x1, x2,L1

;goto L2 if x1<x2 or x2 is -ve
bltu x1, x2, L2
