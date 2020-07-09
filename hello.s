    .include "io.s"

    .text

    .global main
main:
    adr x0, mystring
    bl print0s

    adr x20, mydword
    ldur x1, [x20]
    bl print1d

    mov x21, #124
    stur x21, [x20]
    ldur x1, [x20]
    bl print1d

    adr x22, mydwords
    ldur x1, [x22, #0]
    bl print1d
    ldur x1, [x22, #8]
    bl print1d

    exit

    .data

mydword:
    .dword 123
mydwords:
    .dword 125, 126, 127
mystring:
    .string "Hello, world!"