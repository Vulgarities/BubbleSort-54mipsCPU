#8.1_2 BobbleSort
#YHD 2019 03 12
	.text
input:
	addi $2 $zero 5
	addi $3 $zero 6
	addi $4 $zero 7
	addi $5 $zero 4
	addi $6 $zero 3
bubblesort:#排好序后$2~$6从小到大
b00:
	slt $1,$2,$3          #如果2<3，1$置1
	bne $1, $zero, b01	       #2<3,不做变化进入b01
	#交换2和3
	add $t0,$2,$zero
	add $2,$3,$zero
	add $3,$t0,$zero
b01:	
	slt $1,$3,$4          #如果3<4，1$置1
	bne $1, $zero, b02	       #3<4,不做变化进入b02
	#交换3和4
	add $t0,$3,$zero
	add $3,$4,$zero
	add $4,$t0,$zero
b02:
	slt $1,$4,$5          #如果4<5，1$置1
	bne $1, $zero, b03	       #3<4,不做变化进入b03
	#交换4和5
	add $t0,$4,$zero
	add $4,$5,$zero
	add $5,$t0,$zero
b03:
	slt $1,$5,$6          #如果5<6，1$置1
	bne $1, $zero, b10	       #3<4,不做变化进入b10
	#交换5和6
	add $t0,$5,$zero
	add $5,$6,$zero
	add $6,$t0,$zero
#######第一层结束，6为最大值
b10:
	slt $1,$2,$3          #如果2<3，1$置1
	bne $1, $zero, b11	       #2<3,不做变化进入b11
	#交换2和3
	add $t0,$2,$zero
	add $2,$3,$zero
	add $3,$t0,$zero
b11:	
	slt $1,$3,$4          #如果3<4，1$置1
	bne $1, $zero, b12	       #3<4,不做变化进入b12
	#交换3和4
	add $t0,$3,$zero
	add $3,$4,$zero
	add $4,$t0,$zero
b12:
	slt $1,$4,$5          #如果4<5，1$置1
	bne $1, $zero, b20	       #3<4,不做变化进入b20
	#交换4和5
	add $t0,$4,$zero
	add $4,$5,$zero
	add $5,$t0,$zero
#######第2层结束，5为最大值
b20:
	slt $1,$2,$3          #如果2<3，1$置1
	bne $1, $zero, b21	       #2<3,不做变化进入b11
	#交换2和3
	add $t0,$2,$zero
	add $2,$3,$zero
	add $3,$t0,$zero
b21:	
	slt $1,$3,$4          #如果3<4，1$置1
	bne $1, $zero, b30       #3<4,不做变化进入b30
	#交换3和4
	add $t0,$3,$zero
	add $3,$4,$zero
	add $4,$t0,$zero
#######第3层结束，4为最大值
b30:
	slt $1,$2,$3          #如果2<3，1$置1
	bne $1, $zero, over	       #2<3,不做变化结束
	#交换2和3
	add $t0,$2,$zero
	add $2,$3,$zero
	add $3,$t0,$zero
#第三层结束
over:













