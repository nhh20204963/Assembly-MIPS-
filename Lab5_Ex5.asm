.data
String: .space 24
Rev_string: .space 24
Enter: .asciiz "\n"
.text
	la	$s0, String
	la	$s1, Rev_string
	add	$t3, $s1, $zero
	lw	$s2, Enter
	addi	$s3, $zero, 0		# i = 0
	addi	$s4, $zero, 0		# len = 0
	addi	$s5, $zero, 20		
L1: 	beq 	$s4, $s5, rev
	li 	$v0, 12
	syscall
	beq	$v0, $s2, rev
	add	$t0, $s0, $s3
	sb	$v0, 0($t0)
	add	$t1, $s0, $s4
	addi	$s3, $s3, 1		# i += 1
	addi	$s4, $s4, 1		# len += 1
	j	L1
rev:	beq	$s4, $zero, exit
	lb	$t2, 0($t1)
	sb	$t2, 0($t3)
	addi	$t1, $t1, -1
	addi	$s4, $s4, -1
	addi	$t3, $t3, 1
	j	rev
exit:
	li	$v0, 4
	la	$a0, Enter
	syscall
	li	$v0, 4
	la	$a0, Rev_string
	syscall	