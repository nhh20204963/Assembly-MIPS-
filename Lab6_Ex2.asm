.data
Arr: .word 12,11,13,5,6
N: .word 5
.text
insertion_sort:
	la	$s0, Arr
	lw	$s1, N
	addi	$s2, $zero, 1			# i = 1
for:	
	slt	$t0, $s2, $s1			# t0 = 1 if i < n
	beq	$t0, $zero, exit_for
	mul	$t1, $t0, 4
	add	$t1, $t1, $s0			# address A[i]
	lw	$s3, 0($t1)			# key = values A[i]
	addi	$s4, $s2, -1			# j = i - 1
	while:
		slt	$t2, $zero, $s4		# t2 = 0 if j >= 0
		mul	$t3, $s4, 4		
		add	$t3, $s0, $t3		# address A[j]
		lw	$s5, 0($t3)		# values A[j]
		slt	$t4, $s5, $s3		# t4 = 0 if A[j] >= key
		add	$t2, $t2, $t4		
		beq	$t2, $zero, swap
		j	exit_while
	swap:	
		addi	$t3, $t3, 4		# address A[j + 1]
		lw	$s5, 0($t3)		# A[j+1] = A[j]
		addi	$s4, $s4, -1		# j -= 1
		j	while
	exit_while:
	addi	$s4, $s4, 1			# j = j + 1
	mul	$t3, $s4, 4
	add	$t3, $t3, $s0			# address A[j+1]
	lw	$s3, 0($t3)
	addi	$s2, $s2, 1			# i += 1
	j 	for
exit_for: