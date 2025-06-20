#include "shellcode.h"
#include <unistd.h>


int main()
{
    execl("/bin/sh", "sh", 0, 0);
}