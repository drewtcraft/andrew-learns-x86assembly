# PURPOSE: find highest number in a set of numbers

# VARIABLES
# 	%edi -- holds index of current number
# 	%ebx -- highest number found
# 	%eax -- current number
# 	data_items -- contains all the numbers we will look at

.section .data
	data_items: 
		.long 1,2,3,4,5,6,7,8,9,100,0	# the .long data type takes up 4 bytes?
										# 	for each piece of data, which I
										# 	guess means they fit into
										# 	registers nicely
										# 	---
										# 	other types exist, such as .ascii
										# 	.int, and .byte


.section .text

.globl _start
_start:
	movl $0, %edi 						# move 0 into index register
	movl data_items(,%edi,4), %eax		# move number at index %edi into
										# 	the current number register
										# 	---
										# we use a 4 here because .long data
										# 	is 4 locations in size
	movl %eax, %ebx 					# move current number into highest
										# 	number register
	
	start_loop:							# just another label
		cmpl $0, %eax					# check to see if we are at the end of
										# 	the list
		je loop_exit					# if we are, exit loop and program
										# 	je -- jump if cmpl is equal
										# 	jg -- jump if a < b
										# 	jge -- jump if a <= b
										# 	jl -- jump if a > b
										# 	jle -- jump if a >= b
										# 	jmp -- just jump, no cmpl needed
		incl %edi						# increment our index
		movl data_items(,%edi,4), %eax	# load next current number using index
		cmpl %ebx, %eax					# compare current to highest
		jle start_loop					# jump to beginning if %eax is not 
										# 	bigger
		movl %eax, %ebx					# current number is higher, so move to
										# 	highest number register
		jmp start_loop					# loop again!

	loop_exit:							# another label
		movl $1, %eax					# set exit system call number
		int $0x80						# interrupt program for termination




