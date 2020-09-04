// Shana Slavin
// CPSC 2310 Section 002
// Due November 9, 2018

/* function name: offset

   description: calculates offset with given row and column and number of columns per row

   input parameter(s):
  	r0 = i
	r1 = j
	r2 = n

   return value:
	r0 = offset

   other output parameters:
	none

   effect/output:
	none apart form return value

   method/effect:
	NA

   typical calling sequence:
	put address of i in r0
	put address of j in r1
	put address of n in r2
	call offset
   
   local registar usage:
	r4 = part 1 of calculations
	r5 = part 2 of calculations
	r6 = 4
*/

.global offset

offset:
	
	push {r4-r6, lr}

	// initiates variables
	mov r4, #0
	mov r5, #0
	mov r6, #4

	// begins calculations using (((((i + 1) * n) - (n - (j +1)) * 4) - 4)
	
	add r4, r0, #1 
	mul r4, r2 

	add r5, r1, #1 
	sub r5, r2, r5 
	
	sub r5, r4, r5

	mul r5, r6
	sub r5, r5, r6

	mov r0, r5

	pop {r4-r6, pc}


