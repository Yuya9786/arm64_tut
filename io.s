    .text

    // macro
    // exit
    .macro exit
    .exit\@:
    mov x8, #93
    svc #0
    .endm

    .text
    .global print1d
    .type print1d, %function
print1d:
    stp x29, x30, [sp, #-16]!
    adr x0, print1d_fmt
    bl printf
    ldp x29, x30, [sp], #16
    ret

    .data
print1d_fmt: .string "%d\n"

    .text
    .global print0s
    .type print0s, %function
print0s:
    stp x29, x30, [sp, #-16]!
    bl puts
    ldp x29, x30, [sp], #16
    ret