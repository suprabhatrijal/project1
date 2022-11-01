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


# exit
li $v0, 10
syscall
