.eqv SEVENSEG_LEFT 0xFFFF0011 		# Dia chi cua den led 7 doan trai.
 					# Bit 0 = doan a;
 					# Bit 1 = doan b; ...
					# Bit 7 = dau .
.eqv SEVENSEG_RIGHT 0xFFFF0010		# Dia chi cua den led 7 doan phai
.eqv zero 63
.eqv one 6
.eqv two 91
.eqv three 79
.eqv four 102
.eqv five	109
.eqv six 125
.eqv seven 7
.eqv eight 127
.eqv nine	111
.eqv yellow 64
# 0 = 63, 1 = 6, 2 = 91
# 3 = 79, 4 = 102, 5 = 109
# 6 = 125, 7 = 7, 8 = 127, 9 = 111
.data
MessRed: .asciiz "Enter time of red light: "
MessGreen: .asciiz "Enter time of green light: "
MessYellow: .asciiz "Enter time of yellow light: "
.text	
main:	
	li	$v0, 51
	la	$a0, MessRed
	syscall
	move 	$s0, $a0
	#move 	$t2, $s0
	
	li	$v0, 51
	la	$a0, MessYellow
	syscall
	move 	$s1, $a0
	addi	$s1, $s1, 1
	#move	$t3, $s1
	
	li	$v0, 51
	la	$a0, MessGreen
	syscall
	move 	$s2, $a0
	addi 	$s2, $s2, 1
	#move	$t4, $s2

run:	move 	$t2, $s0
	move 	$t3, $s1
	move 	$t4, $s2	
run_red:	
	div 	$t0, $t2, 10
	mul	$t1, $t0, 10
	sub	$t1, $t2, $t1
	j 	donvi

run_yellow:
	li	$a1, yellow
	li	$a0, yellow
	show_yellow_light:
		li	$t0, SEVENSEG_LEFT		# assign port's address
		sb	$a1, 0($t0)		# assign new value
		nop	
		li	$t0, SEVENSEG_RIGHT	 	# assign port's address
 		sb 	$a0, 0($t0)		# assign new value
 		nop
 	j 	loop_yellow
	
run_green:
	div 	$t0, $t4, 10
	mul	$t1, $t0, 10
	sub	$t1, $t4, $t1
	j 	donvi

donvi:	beq	$t1, 0, zeroR
	beq	$t1, 1, oneR	
	beq	$t1, 2, twoR	
	beq	$t1, 3, threeR
	beq	$t1, 4, fourR
	beq	$t1, 5, fiveR
	beq	$t1, 6, sixR
	beq	$t1, 7, sevenR
	beq	$t1, 8, eightR
	beq	$t1, 9, nineR	
	
chuc:	beq	$t0, 0, zeroL
	beq	$t0, 1, oneL	
	beq	$t0, 2, twoL	
	beq	$t0, 3, threeL
	beq	$t0, 4, fourL
	beq	$t0, 5, fiveL
	beq	$t0, 6, sixL
	beq	$t0, 7, sevenL
	beq	$t0, 8, eightL
	beq	$t0, 9, nineL
	
zeroR:	li	$a0, zero	
	j chuc
oneR:	li	$a0, one	
	j chuc
twoR:	li	$a0, two
	j chuc
threeR:	li	$a0, three	
	j chuc
fourR:	li	$a0, four
	j chuc
fiveR:	li	$a0, five
	j chuc
sixR:	li	$a0, six
	j chuc
sevenR:	li	$a0, seven	
	j chuc
eightR:	li	$a0, eight	
	j chuc
nineR:	li	$a0, nine

	j chuc
zeroL:	li	$a1, zero	
	j show
oneL:	li	$a1, one	
	j show
twoL:	li	$a1, two	
	j show
threeL:	li	$a1, three	
	j show
fourL:	li	$a1, four	
	j show
fiveL:	li	$a1, five
	j show
sixL:	li	$a1, six
	j show
sevenL:	li	$a1, seven
	j show
eightL:	li	$a1, eight	
	j show
nineL:	li	$a1, nine	
	j show

show:
	jal	SHOW_7SEG
	nop	
	jal	SHOW_7SEG
	nop
	
loop_red:
	beq	$t2, 0, loop_green
	addi 	$t2, $t2, -1
	j	run_red	

loop_green:
	beq	$t4, 0, loop_yellow
	addi	$t4, $t4, -1
	j	run_green

loop_yellow:
	beq	$t3, 0, run
	addi	$t3, $t3, -1
	j	run_yellow
	
exit:	li	$v0, 10
	syscall
endmain:

#---------------------------------------------------------------
# Function SHOW_7SEG : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed
#---------------------------------------------------------------
SHOW_7SEG:	li	$t0, SEVENSEG_LEFT		# assign port's address
		sb	$a1, 0($t0)		# assign new value
		nop	
		li	$t0, SEVENSEG_RIGHT	 	# assign port's address
 		sb 	$a0, 0($t0)		# assign new value
 		nop
		jr 	$ra
		nop

	
