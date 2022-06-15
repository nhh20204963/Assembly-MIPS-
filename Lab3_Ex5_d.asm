data
A: .word 5, 1, 2, -3, 1
.text
addi $s5, $zero, 0#sum = 0
addi $s1, $zero, 0#i = 0
la $s2, A # set s2 to address of A
addi $s3, $zero, 5 # n=5
addi $s4, $zero, 1 # step=1
loop: add $t1,$s1,$s1#$t1=2*$s1
add $t1,$t1,$t1#$t1=4*$s1
add $t1,$t1,$s2#$t1 store the address of A[i]
lw $t0,0($t1)#load value of A[i] in $t0
add $s5,$s5,$t0#sum=sum+A[i]
add $s1,$s1,$s4#i=i+step
beq $t0, $zero, endloop # if A[i]==0, endloop 
j loop #goto loop
endloop:
