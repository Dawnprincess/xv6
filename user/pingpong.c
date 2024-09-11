#include"kernel/types.h"
#include"user/user.h"

#define READEND 0
#define WRITEEND 1

int main(int argc, char *argv[]){
	int pc[2],cp[2];
	int pid;
	char buf[1];

	pipe(pc);
	pipe(cp);

	pid=fork();

	if(pid==0){
		close(pc[WRITEEND]);
		close(cp[READEND]);
		printf("%d: received ping\n",getpid());
		write(cp[WRITEEND]," ", 1);
		close(pc[READEND]);
		close(cp[WRITEEND]);
		exit(0);
	}else{
		close(cp[WRITEEND]);
		close(pc[READEND]);
		write(pc[WRITEEND], " ", 1);
		read(cp[READEND],buf ,1);
		printf("%d: received pong\n",getpid());
		close(pc[READEND]);
		close(cp[WRITEEND]);
		exit(0);
	}
}


