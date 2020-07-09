    .include "io.s"
    .text

    .global main
main:
    adr x0, v           // array
    adr x20, k
    ldur x1, [x20, #0]  // size
    bl max
    mov x1, x13
    bl print1d
    exit

    .global max
    .type max, %function
max:
    stp x29, x30, [sp, #-16]!
    stp x21, x20, [sp, #-16]!

    mov x20, x0
    mov x21, x1

    mov x10, #0
    mov x13, #0
loop:
    mov x14, #8
    mul x12, x10, x14
    add x22, x20, x12
    ldur x11, [x22]
    cmp x11, x13
    ble end
    mov x13, x11
end:
    add x10, x10, #1
    cmp x10, x21
    blt loop
    ldp x21, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret


    .data
v:  .dword 1, 3, 5, 7, 9, 8, 6, 56, 2, 0
k:  .dword 10