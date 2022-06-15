.data
Arr: .word 10,9,8,7,6,5
N: .word 6
.text
bubble sort:
	la	$s0, Arr
	lw	$s1, N
	addi	$s2, $zero, 0		# i = 0
	addi	$s3, $s1, -1		# s3 = N - 1
Loop1:	slt	$t0, $s2, $s3		# t0 = 1 if i < N - 1
	beq	$t0, $zero, exit	# exit if i >= N - 1
	addi	$s4, $zero, 0		# j = 0
	sub	$s5, $s3, $s2		# s5 = N - 1 - i
	addi	$s2, $s2, 1		# i += 1
Loop2:	slt	$t1, $s4, $s5		# t1 = 1 if j < N - 1 - i
	beq	$t1, $zero, Loop1
	mul	$t2, $s4, 4
	add	$t3, $s0, $t2		# address of Arr[j]
	lw	$s6, 0($t3)		# values of Arr[j]
	addi	$t3, $t3, 4
	lw	$s7, 0($t3)		# values of Arr[j + 1]
	slt	$t4, $s7, $s6		# t4 = 1 if arr[j+1] < arr[j]
	bne	$t4, $zero, swap
	addi 	$s4, $s4, 1		# j += 1
	j 	Loop2
	nop	
swap:
	sw	$s6, 0($t3)
	addi	$t3, $t3, -4
	sw	$s7, 0($t3)
	addi	$s4, $s4, 1
	j	Loop2
	nop
exit:
	
	
