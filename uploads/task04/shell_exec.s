section .data
    sh_path db '/bin/sh', 0 ; db meaning defining the byte
    argv dq sh_path, 0
    envp dq 0

section .text
    global _start

_start:
    mov rax, 59             ; 59 for execve
    lea rdi, [rel sh_path]  ; first arg, rel is doing the
                            ; program position-independent
    lea rsi, [rel argv]     ; second arg
    lea rdx, [rel envp]     ; third arg
    syscall