#include "shellcode.h"
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

int main()
{
    void *exec_mem = mmap(NULL, shellcode_len,  PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
    if (exec_mem == MAP_FAILED) {
        return 1;
    }
    memcpy(exec_mem, shellcode, shellcode_len);
    void (*sc)() = (void (*)())exec_mem;
    sc();
}