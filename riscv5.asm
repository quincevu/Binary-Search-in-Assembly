.data
array: .word 1,2,3,4,5,6,7,8,9
size: .word 9
target: .word 5





.globl main

.text
main:
la a0, array
li a1, 0
la a2, size
lw a2, 0(a2)




binarysearch:
