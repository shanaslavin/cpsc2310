@ Shana Slavin
@ CPSC 2311
@ Section 001


	.global	fact
fact:
    push  {r1, lr}        

    cmp   r0, #1          
    beq   done            

    mov  r1, r0           
    sub  r0, r0, #1       
    bl   fact             

    mul  r0, r1, r0       

done:
    pop  {r1, pc}         
    .size    fact, .-fact

    .align   2
    .section .rodata
fmt_str:
    .ascii   "The factorial of %d is %d\012\000"

    .text
    .align   2
    .global  main
main:
    push {lr}             @ save the link register so we can jump back to 
	
    @ MAIN CODE GOES HERE
    
    mov r0, #10

    bl fact

    mov r2, r0

    mov r1, #10

    ldr r0, =fmt_str

    bl printf

    mov r0, #0


    pop  {pc}             @ pop the top of the stack

	.size    main, .-main
	.ident   "GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section .note.GNU-stack,"",%progbits
