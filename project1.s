.data
input: .space 11
prompt: .asciiz "Enter 10 characters: "
nl: space "\n"
.text
main:
# exit
li $v0, 10
syscall
