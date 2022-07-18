.extern _ZN5Riscv21supervisorTrapHandlerEv
.global supervisorTrap
.align 4
.type supervisorTrap, @function

supervisorTrap:
    addi sp, sp, -256

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    call _ZN5Riscv21supervisorTrapHandlerEv

    csrr a1, scause
    addi a1, a1, -8
    beqz a1, syscall
    addi a1, a1, -1
    bnez a1, other

syscall:
    sd x10, 0x50(sp)
other:

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr


    add sp, sp, 256

    sret