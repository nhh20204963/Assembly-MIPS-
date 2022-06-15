.data
A: .word 1,5,-3,7,-11,-4,19,-21,20,-2
n: .word 10
.text
	la	$s0, A
	lw	$s1, n
	addi	$s2, $zero, 0		# max(abs(A[i])) = 0
	addi	$s3, $zero, 0		# A[i] co abs la max
	addi	$s4, $zero, 0		# i = 0
loop:	slt	$t0, $s4, $s1		# t0 = 1 if i < n
	beq	$t0, $zero, end	
	addi	$s4, $s4, 1		# i = i + 1
	lw 	$t1, 0($s0)		# t1 = A]i]
	abs	$t2, $t1			# t2 = abs(t1)
	slt	$t3, $t2, $s2		# t3 = 1 if abs[i] < max
	beq	$t3, $zero, swap
	addi	$s0, $s0, 4
	j 	loop
swap:	add	$s2, $zero, $t2
	add	$s3, $zero, $t1
	addi	$s0, $s0, 4
	j	loop
end:

	