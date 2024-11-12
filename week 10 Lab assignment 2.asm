.data
    num1: .word 10
    num2: .word 25
    num3: .word 15
    result: .word 0
    msg1: .asciiz "The three numbers are: "
    msg2: .asciiz "The maximum of the three numbers is: "
    space: .asciiz " "
    newline: .asciiz "\n"

.text
.globl main

main:
    # Load the three numbers into registers
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3
    
    # Print the first message
    li $v0, 4
    la $a0, msg1
    syscall
    
    # Print num1
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    
    # Print num2
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    
    # Print num3
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Initialize max with the first number
    move $t3, $t0
    
    # Compare max with the second number
    bge $t3, $t1, check_third
    move $t3, $t1
    
check_third:
    # Compare max with the third number
    bge $t3, $t2, print_result
    move $t3, $t2
    
print_result:
    # Store the maximum value in result
    sw $t3, result
    
    # Print the second message
    li $v0, 4
    la $a0, msg2
    syscall
    
    # Print the maximum value
    li $v0, 1
    move $a0, $t3
    syscall
    
    # Exit program
    li $v0, 10
    syscall