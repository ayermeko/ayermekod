#include "shellcode.h"
#include <stddef.h>


int main()
{
    execve("/bin/sh", 0, 0);
}