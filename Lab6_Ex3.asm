.data
Arr: .word 5,1,4,2,8
N: .word 5
.text
	la	$s0, Arr
	lw	$s1, N
	addi	$s2, $s1, -1
	addi	$t0, $zero, 0		# i = 0
L1:	slt	$t1, $t0, $s2
	beq	$t1, $zero, exit
	addi	$t2, $zero, 0		# j = 0
	sub	$t3, $s2, $t0
L2:	slt	$t4, $t2, $t3
	addi	$t0, $t0, 1		# i += 1
	beq	$t4, $zero, L1
	mul	$t5, $t2, 4
	add	$t5, $t5, $s0
	lw	$s3, 0($t5)		# arr[j]
	lw	$s4, 4($t5)		# arr[j + 1]
	slt	$t6, $s4, $s3		# t6 = 1 if a[j+1]<a[j]
	bne	$t6, $zero, swap
	addi	$t2, $t2, 1
	j	L2
swap:	
	move	$s5, $s3
	move	$s3, $s4
	move	$s4, $s5
	addi	$t2, $t2, 1
	j	L2 
exit: