.data
array: .word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
#len: .word 13

.text
la $s0, array
li $s1, 13
#lw $s1, 0($s1) 
addi $t0, $t0, 0 	# init i
addi $t1, $t1, 0	# init key
addi $t2, $t2, 0	# init j
j loop

loop:
	# check loop condition
	slt $t3, $t0, $s1
	beq $t3, $zero, exit

	# assign key to array[i]
	mul $t4, $t0, 4
	add $t1, $t4, $s0
	lw $t1, 0($t1)
 
	add $t2, $t0, -1	# j = i - 1

	#while loop
	while:
		# if j < 0 -> exit while loop
		sge $t5, $t2, $zero
		beq $t5, $zero, exit_while

		# assign $t6 to array[j]
		mul $t4, $t2, 4
		add $t6, $t4, $s0	# $t6 contains address of array[j]
		lw $t6, 0($t6)
		
		# if array[j] <= key -> exit while loop
		sgt $t5, $t6, $t1
		beq $t5, $zero, exit_while

		# array[j + 1] = array[j]
		addi $t5, $t2, 1	# $t5 = j + 1
		mul $t5, $t5, 4		# $t5 = 4(j + 1)
		add $t5, $t5, $s0	# $t5 contains address of array[j + 1]
		sw $t6, 0($t5)
		
		# j--
		add $t2, $t2, -1
		
		j while
	exit_while:
	
	# array[j + 1] = key
	addi $t5, $t2, 1	# $t5 = j + 1
	mul $t5, $t5, 4		# $t5 = 4(j + 1)
	add $t5, $t5, $s0	# $t5 contains address of array[j + 1]
	sw $t1, 0($t5)
	
	# i++
	addi $t0, $t0, 1
	
	j loop
exit:
