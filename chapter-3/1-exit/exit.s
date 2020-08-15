# PURPOSE: create a program that exits with a reasonable status code

# INPUT: none

# OUTPUT: status code, viewed with "echo $?"

# VARIABLES: 
#	%eax holds system call number
#	%ebx holds return status

.section .data
# not a damn thang

.section .text
.globl _start

_start:
	# linux kernel command for exiting program
	movl $1, %eax

	# status number we will return
	movl $0, %ebx

	# "wakes up" the kernel to run the command
	int $0x80
