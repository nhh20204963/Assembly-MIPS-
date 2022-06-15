.data
A: .word 7, -2, 5, 1, 5,6,7,3,6,8,8,59,5

.text
main:
	la $a0, A
	li $a1, 13
	j bubble_sort

bubble_sort:
	li $t0, 0	# i = 0
	#li $t1, 0	# j = 0

	loop1:
		bge $t0, $a1, end_loop1	# if i >= n -> out
		sub $a2, $a1, 1
		sub $a2, $a2, $t0	# a2 = n - i - 1
		li $t1, 0	#j = 0
		loop2:
			bge $t1, $a2, update_loop1	# if j >= n - i - 1 -> out loop2
			add $t2, $t1, $t1
			add $t2, $t2, $t2
			add $t2, $a0, $t2
			lw $t3, 0($t2)	# t3 = A[j]
		
			add $t4, $t1, 1
			add $t4, $t4, $t4
			add $t4, $t4, $t4
			add $t4, $a0, $t4
			lw $t5, 0($t4)	# t5 = A[j+1]
			
			bgt $t3, $t5, swap

		update_loop2:
			addi $t1, $t1, 1	#j++
			j loop2

	update_loop1:
		addi $t0, $t0, 1	#i++
		j loop1
		
swap:
	sw $t3, 0($t4)
	sw $t5, 0($t2)
	j update_loop2

end_loop1:		
