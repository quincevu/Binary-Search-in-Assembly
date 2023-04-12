#ao has address of the array
#a1 is array size
#a2 is target

.data
	array:	.word 2, 5, 8, 12, 16, 23, 38, 56, 72, 91
	size:	.word 10
	target:	.word 23

.global binarySearch

binarySearch:
#la	a2, target


addi a4, a1, -1 # high = size -1 
addi a7, a1, 0 # flag = high + 1 , gets updated everytime




while:	bgt a3, a7, DONE
	# int mid = ( low + high ) /2
	add, a5, a3, a4 # mid = low + high
	srli a5, a5, 1 # mid = mid / 2
	lw t1, 0(a5) #load nums[mid[ to t1
	bne t1, a2, ELSE # if nums[mid] == target then do , ELSE
	addi ra, zero, a5 # return value = mid
	jalr ra #return mid
	ELSE: 
	blt a2, t1, L1 #if target < nums[mid] then L1 else do this
	addi a3, a5, 1 # low = mid + 1
	L1: addi a4, a5, -1 # high = mid - 1
	
	sub a7, a7, a7 #flag = 0
	addi a7, a4, 1 #flag = high + 1 
	j while

DONE: 	addi ra, ra, -1
	ret
