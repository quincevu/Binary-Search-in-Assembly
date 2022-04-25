li t0, 650
li t1, 720

bgt t0, t1, LARGER
add t0, t0, t1
srli t0, t0, 6
j DONE
LARGER:
sub t1, t0, t1
addi a7, a7, 20
mul t1, t1, a7
DONE: