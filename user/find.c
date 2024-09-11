#include "kernel/types.h"
#include "user/user.h"
#include "kernel/fs.h"
#include "kernel/stat.h"
#include "kernel/fcntl.h"



void find(char *path,char *target_file,const char* etname) {
    int fd;//文件描述符
    struct stat st;
    struct dirent de;
    char buf[512], *p;

    //st文件状态，de存条目信息,buf构建文件路径，p辅助构建

    if ((fd = open(path, 0)) < 0) {
        fprintf(2, "ERROR: cannot open %s\n", path);
        return;
    }
    if ((fstat(fd, &st)) < 0) {
        fprintf(2, "ERROR: cannot stat %s\n", path);
        close(fd);
        return;
    }
    switch (st.type) {
        case T_FILE:
            if (etname && strcmp(target_file, etname) == 0)
                printf("%s\n", path);
            break;
        case T_DIR:
            if (strlen(path) + 1 + DIRSIZ + 1 > sizeof(buf)) {
                printf("path is too long\n");
                break;
            }
            strcpy(buf, path);
            p = buf + strlen(buf);
            *p++ = '/';

            while (read(fd, &de, sizeof(de)) == sizeof(de)) {
                //每次读取一条条目信息
                if (de.inum == 0)
                    continue;
                //如果该文件目录项索引号为0，即空目录,直接跳过
                if (strcmp(de.name, ".") == 0 || strcmp(de.name, "..") == 0)
                    continue;
                memmove(p, de.name, DIRSIZ);
                //将文件名贴在路径名后面
                p[DIRSIZ] = 0;
                find(buf, target_file, p);
            }//尝试获取新文件状态
            break;
    }
    close(fd);
}
void findfile(char *path,char *file){
    find(path, file, (void *)0);
}

int main(int argc, char *argv[]){
    if(argc!=3){
        fprintf(2,"ERROR: Yyou need pass in only 2 arguments\n");
        exit(1);
    }
    char *target_path = argv[1];
    char *target_file = argv[2];
    findfile(target_path, target_file);
    exit(0);
}
