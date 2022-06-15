.data
Mess: .asciiz "Enter string: "
Mess1: .asciiz "Inverse number character: "
Str: .space 50
Inv_str: .space 50
.text
main:
	la	$s0, Str		# save base address of Str in $s0
	la	$s1, Inv_str		# save base address of Inv_str in $s1
	
# ----------
# Procedure Enter_string:
# Function: InputDialogString
Enter_string:
	li	$v0, 54
	la	$a0, Mess
	la	$a1, Str
	la	$a2, 30
	syscall
	
# ----------
# Procedure Store_sp_address:
Store_sp_address: 
	move	$s2, $sp		# save values in $s2 = address stack pointer
	
# ----------
# Procedure Store_num_character
# Function: Store number character in Str on stack
Store_num_character:
	lb	$t0, 0($s0)			# save value of string start Str[0]
	beq	$t0, $zero, Exit_store		# exit if value null	
	addu	$s0, $s0, 1			# base address of str + 1 
	j	Check_num_character		# check if t0 is a number
		
	# ----------
	# Procedure Push
	# Function: Push t0 to stack if t0 if a number	
	Push:	subu	$s2, $s2, 1		# adjust the stack pointer 
		sb	$t0, 0($s2)		# push t0 to stack
		j	Store_num_character	# return Store_num_chacracter
		
	# ----------
	# Procedure Check_num_chacracter
	# Function: Check if a character is a number
	Check_num_character:
		sltiu	$t1, $t0, 58		# t1 = 1 if t0 < ":" with 58 is ascii of ":"
						# ":" is character behind the "9" in ascii
		sgtu	$t2, $t0, 47		# t2 = 1 if t0 > "/: with 47 if ascii of "/"
						# "/" is character after the "0" in ascii
		add	$t3, $t1, $t2		# t3 = t1 + t2
		subu	$t3, $t3, 2		# t3 -= 2
		beq	$t3, $zero, Push	# if t3 = 0 then value in t0 is character
		j	Store_num_character	# return Store_num_chacracter procedure
Exit_store:

# ----------
# Procedure Inver_num_character
# Save number character from stack to Inv_str
Inverse_num_character:
	beq	$s2, $sp, Exit_inverse		# stop if s2 = stack pointer
	j	Pop				# jump Pop procedure
	
	# ---------
	# Procedure Pop
	# Function: Pop from stack 
	Pop:	lb	$t0, 0($s2)		# pop from stack to $t0
		addu	$s2, $s2, 1		# adjust the stack pointer
		j	Store_inverse_string	# jump Store_inverse_string procedure
		
	# ----------
	# Procedure Store_inverse_string
	# Function: Store values in stack to Inv_str
	Store_inverse_string:
		sb	$t0, 0($s1)		# store $t0 values to Inv_str
		addu	$s1, $s1, 1		# Address of Inv_str += 1				
		j	Inverse_num_character	# jump Inverse_num_character procedure
Exit_inverse:
	
# ----------
# Procedure Show_to_screen
# show to screen in inverse order using stack.
	
Show_to_screen:	
	li	$v0, 59
	la	$a0, Mess1
	la	$a1, Inv_str
	syscall
	

	
	
	
	
	
	
	
	


