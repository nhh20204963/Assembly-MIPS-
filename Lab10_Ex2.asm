.eqv MONITOR_SCREEN 0x10010000 	#Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 		#Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
	li $k0, MONITOR_SCREEN 	#Nap dia chi bat dau cua man hinh
 	# In HAI ra man hinh
 	li $t0, WHITE
 	sw $t0, 0($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 64($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 128($k0)
 	nop
	li $t0, WHITE
 	sw $t0, 192($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 256($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 132($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 8($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 72($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 136($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 200($k0)
 	nop
 	li $t0, WHITE
 	sw $t0, 264($k0)
 	nop
 	
 	li $t0, GREEN
 	sw $t0, 272($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 212($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 152($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 92($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 32($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 100($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 168($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 236($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 304($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 216($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 220($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 224($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 228($k0)
 	nop
 	li $t0, GREEN
 	sw $t0, 232($k0)
 	nop
 	
 	li $t0, YELLOW
 	sw $t0, 56($k0)
 	nop
 	li $t0, YELLOW
 	sw $t0, 120($k0)
 	nop
 	li $t0, YELLOW
 	sw $t0, 184($k0)
 	nop
 	li $t0, YELLOW
 	sw $t0, 248($k0)
 	nop
 	li $t0, YELLOW
 	sw $t0, 312($k0)
 	nop
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
