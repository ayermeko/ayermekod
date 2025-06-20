section .text
    global _start

_start:     ; we will call execve("/bin/ls, **argv, **envp)
    xor     rsi, rsi            ; second arg
    push    rsi
    mov     rbx, 0x68732f6e69622f2f ; same as //bin/sh, but written in shellcode bytes, little endian. use xxd on file with '/bin/sh' to get it reversed
    push    rbx
    mov     rdi, rsp            ; first arg
    xor     rdx, rdx            ; third arg    
    mov     rax, 59             ; syscal for execve
    syscall