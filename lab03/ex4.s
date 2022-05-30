.globl iterative
.globl recursive

.data
n: .word 1200
m: .word 45

.text
main:
    la t0, m
    lw a3, 0(t0)
    jal ra, tester

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

tester:
	la t0, n
    lw a2, 0(t0)
    
    call iterative
    
    la t0, n
    lw a2, 0(t0)
    call recursive
    
    bne a0, a1, return_0
    jalr x0, x0, 16

return_0:
addi a0, x0, -1
jalr x0, x0, 16

iterative:
    add t0, x0, x0
    iterative_loop:
    	sub a2, a2, a3
    	addi t0, t0, 1
        bge a2, a3, iterative_loop
    add a0, x0, t0
    ret
    
recursive:
    sub a2, a2, a3
   	addi a4, a4, 1
    blt a2, a3, return
    call recursive
    
return:
	add a1, x0, a4
    jalr x0, x0, 100