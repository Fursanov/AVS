iterative:
    addi t0, x0, 16
    addi t1, x0, 5
    add t2, x0, x0

fib:
    blt t0, t1, ret
    sub t0, t0, t1
    addi t2, t2, 1
    j fib # loop

ret:
    addi a0, x0, 1
    addi a1, t2, 0
    ecall
    addi a0, x0, 10
    ecall