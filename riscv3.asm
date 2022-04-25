.data
array: .word  2, 5, 8, 12, 16, 23, 38, 56, 72, 91
size: .word 10
target: .word 23
.globl  main
.text
main:
la a0, array # a0: address of array
li a1, 0 # a1: left index
la t0, size
lw t0, 0(t0)
addi a2, t0, -1 # a2: right index
la t0, target
lw a3, 0(t0) # a3: target
jalr a3, BinarySearch
li a7, 1
ecall
li a7, 10
ecall

BinarySearch:
while:  
bgt a1, a2, exit_notfound
sub t0 a2, a1
srai t0, t0, 1
add t0, t0, a1 # t0 = mid index
slli t1, t0, 2
add t1, a0, t1
lw t1 0(t1) # t1 = array[mid]
beq t1, a3, found
blt t1, a3, righthalf
lefthalf:
addi a2, t0, -1
j while
righthalf:
addi a1, t0, 1
j while
found:
add a0, t0, zero
jr ra
exit_notfound: # left > right, not found
li a0, -1
jr ra