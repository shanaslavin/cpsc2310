// Shana Slavin
// CPSC 2310 Section 002
// Due November 9, 2018

/* uses command line inputs to find offset using column, row,
	and number of rows per column
*/

.global main

main:
	push {lr}

	/* retrieves command line inputs and converts them to integers */
	mov r4, r1 
	ldr r0, [r4, #4]
	bl atoi
	mov r5, r0 

	ldr r0, [r4, #8]
	bl atoi
	mov r6, r0 

	ldr r0, [r4, #12]
	bl atoi
	mov r7, r0

	/* moves command line inputs to scratch registars */
	mov r0, r5 
	mov r1, r6 
	mov r2, r7 
	bl offset

	/* prints output */
	mov r3, r0
	ldr r0, =ans
	mov r1, r5
	mov r2, r6
	bl printf

	pop {pc}




ans: 
	.ascii "the offset for a[%d][%d] is %d\012\000"
