.data
input: .space 11
.text
main:
# Program should convert a certain base into decimal

# Get the user input
li $v0, 8
la $a0, input
li $a1, 11
syscall

# print new line
li $v0, 11
la $a0, 10
syscall

# initialize the loop
li $s0, 0 # counter variable
li $s1, 10 # the end of loop range
la $s2, input # Address of the input string
li $s3, 0 # sum of all numbers


loop:
# Load the current character into s0
lb $s4, 0($s2) # current character

# character falls in the range  '0' to '9'

# char < 47
slti $t0, $s4, 48 

# not (char < 48)  ===> ( char >= 48)
nor $t0, $t0, $zero

# char < 58
slti $t1, $s4, 58

and $t0, $t0, $t1
li $t1, 1
# if char >= 48 and char < 58
beq $t0, $t1, Number

# character falls in the range  'a' to 'y'

# char < 97
slti $t0, $s4, 97 

# not (char < 97)  ===> ( char  >= 97)
nor $t0, $t0, $zero

# char < 123
slti $t1, $s4, 122

and $t0, $t0, $t1
li $t1, 1
# if char >= 97 and char < 123
beq $t0, $t1, Lower

# character falls in the range  'A' to 'Y'

# char < 65
slti $t0, $s4, 65 

# not (char < 65)  ===> ( char >= 65)
nor $t0, $t0, $zero

# char < 90
slti $t1, $s4, 90

and $t0, $t0, $t1
li $t1, 1
# if char >= 65 and char < 90
beq $t0, $t1, Upper

j loopCOTD

Number:
addi $s4, $s4, -48
add $s3, $s3, $s4 

j loopCOTD

Lower:
addi $s4, $s4, -87
add $s3, $s3, $s4 

j loopCOTD

Upper:
addi $s4, $s4, -55
add $s3, $s3, $s4 

j loopCOTD


loopCOTD:
# set the register t2 to point at the next character
addi $s2, 1

# increment the counter variable
addi $s0, $s0, 1
bne $s0, $s1 loop 

# Multiply by (N-25)
li $s4, 10
mult $s3, $s4

mflo $s3

# Print the final output
li $v0, 1
addi $a0, $s3, 0
syscall

# exit
li $v0, 10
syscall
