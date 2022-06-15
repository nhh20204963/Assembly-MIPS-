.data
InputMessage:		.asciiz	"Input a even number: "
LuckyMessage:		.asciiz "isLucky(n) = true"
UnLuckyMessage:		.asciiz "isLucky(n) = false"
InvalidMessage:		.asciiz "Invalid input ( String or float)"
OddNumberMessage:	.asciiz "Odd Number"
NegativeMessage: 	.asciiz "Negative Number"
.text
main:
	getInput:
		li $v0, 51
		la $a0, InputMessage
		syscall
	
	beq $a1, -1, invalidInput	# check if input is string
	
	beq $a0, 0, oddNumberInvalid	# check if input number equals 0
	
	slt $t0, $a0, $zero
	bne $t0, $zero, negativeNumber	# check if input number is negative number
		
	addi $s0, $a0, 0	# store input value in $s0
	li $s1, 0		# init count = 0
	jal countInput
	
	addi $a0, $s1, 0	# $a0 contains the number of digits of the input value
	jal checkOddNumber
	
	add $s2, $s2, $v0	# store half of count
	addi $s3, $s3, 0	# store sum of firt half
	addi $s4, $s4, 0	# store sum of second half
	
	mainLoop:
		beq $s1, 0, endMainLoop		# if s1 == 0 -> exit
		div $s0, $s0, 10		# s0 = s0 / 10
		mfhi $t0			# get remainder of previous devision
		
		sumSecondHalf:
			sle $t1, $s1, $s2	# if half count < half of count
			bne $t1, $zero, sumFirstHalf	# go to calculate sum of first half
			add $s4, $s4, $t0	# sum of second half += remainder
			j prepare		# prepare for the next loop
		
		sumFirstHalf:
			add $s3, $s3, $t0	# sum of first half += remainder
			j prepare		# prepare for the next loop
		
		prepare:
			add $s1, $s1, -1	# count--
			j mainLoop		# go back to for loop
		
	endMainLoop:	
		beq $s3, $s4, luckyNumber	# if sum of first half equals sum of second half -> lucky number
		j unLuckyNumber			# jump to unlucky number if not
		
endMain:
	j exit	# exit program

#-------------------------------------------------------------
# Procedure countInput: count number of digits of input value
# Parameters: $a0 input value
# Return: $v0 number of digits
#-------------------------------------------------------------
countInput:
	loop: 	
		beq $a0, 0, endloop	# check a0 equals 0 or not
		div $a0, $a0, 10	# a0 = a0 / 10
		addi $s1, $s1, 1	# count++
		j loop			# go back for loop
	endloop:
		addi $v0, $s1, 0	# v0 store count
		jr $ra			# jump to calling
	
#-------------------------------------------------------------
# Procedure checkOddNumber: check whether this input value is an odd number or an even number
# Parameters: $a0 input value
# Return: $v0 the remainder after dividing the input value by 10
#-------------------------------------------------------------
checkOddNumber:
	div $t0, $a0, 2			# divide a0 by 2 and store in t0
	mfhi $t3			# get remainder
	mflo $v0			# get quotient
	
	bne $t3, 0, oddNumberInvalid	# if remainder is 1 -> odd number
	jr $ra				# jump to calling

#-------------------------------------------------------------
# Output to screen
#-------------------------------------------------------------
oddNumberInvalid:
	li $v0, 55
	la $a0, OddNumberMessage
	syscall
	j endMain

luckyNumber:
	li $v0, 55
	la $a0, LuckyMessage
	syscall
	j endMain

unLuckyNumber:
	li $v0, 55
	la $a0, UnLuckyMessage
	syscall
	j endMain

negativeNumber:
	li $v0, 55
	la $a0, NegativeMessage
	syscall
	j endMain
	
invalidInput:
	li $v0, 55
	la $a0, InvalidMessage
	syscall
	j endMain
#-------------------------------------------------------------
# Exit program
#-------------------------------------------------------------
exit:	
		
