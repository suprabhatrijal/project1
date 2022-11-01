.data
input: .space 11
prompt: .asciiz "Enter 10 characters: "
nl: space "\n"
.text
main:
# Get the user input
li $v0, 8
la $a0, input
li $a1, 11
syscall


# print new line
li $v0, 4
la $a0, nl
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

# exit
li $v0, 10
syscall
