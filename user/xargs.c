#include "kernel/types.h"
#include "user/user.h"
#include "user/user.h"
#include "kernel/fs.h"
#include "kernel/stat.h"
#include "kernel/param.h"
#define MSGSIZE 16

int main(int argc, char *argv[]){
    sleep(10);
    char buf[MSGSIZE];
    read(0,buf,MSGSIZE);//将管道中的消息读入

    //读取自己的参数
    char *xargs[MAXARG];
    int xargc = 0;
    for(int i=1;i < argc;i++){
        xargs[xargc] = argv[i];
        xargc++;
    }
    char *p = buf;
    for(int i =0;i < MSGSIZE;i++){
        if(buf[i] == '\n'){
            //buf到达最后一个字符时
            int pid=fork();//
            if(pid > 0){
                p = &buf[i + 1];
                wait(0);
            }
            else{
                //子进程调用exec运行
                buf[i] = 0;
                xargs[xargc++] = p;
                xargs[xargc++] = 0;
                exec(xargs[0], xargs);
                exit(0);
            }
        }
    }
    //wait(0);//等待所有子进程结束
    exit(0);
}
