# PURPOSE: create a program that exits with a reasonable status code

# INPUT: none

# OUTPUT: status code, viewed with "echo $?"

# VARIABLES: 
#	%eax holds system call number
#	%ebx holds return status

# this sort of thing that starts with a dot is called an 
# 	"assembler-directive"
.section .data # this .section is for listing memory storage the program needs

.section .text # this .section is for instructions

# .globl tells the assembler that the linker will need to use "_start"
# _start is a symbol, which means it gets 
# 	swapped out for a memory address later
.globl _start

# this defines the value of _start
# this is a label, which is a symbol followed by a value
_start:
	# linux kernel command for exiting program
	# ---
	# movl has two operands, source and destination
	# ---
	# the "$" says we want the immediate address of the number 1
	# basically just the number 1
	# ---
	# the %eax register handles the numbers corresponding to  system calls
	# the 1 system call calls the exit program
	movl $1, %eax

	# status number we will return
	# ---
	# the exit system call requires a value in the %ebx register
	# so we move 0 into it
	movl $0, %ebx

	# "wakes up" the kernel to run the command
	# ---
	# int means "interrupt"
	# this interrupts the program flow and transfers control to Linux
	# 	to make a system call for us
	# ---
	# looks like yaboi needs to brush up on hexadecimals
	int $0x80
