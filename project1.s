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

# exit
li $v0, 10
syscall
