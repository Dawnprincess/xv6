#include "kernel/param.h"
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
void main(){
    unsigned int i = 0x00646c72;
    //小端序，依次读入72 6c 64 00
    //如果换为大端序，依次读入00 64 6c 72
    printf("H%x Wo%s", 57616, &i);
    exit(0);
}



