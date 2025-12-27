#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
    int i, pid, count = 0;

    for (i = 0; i < 3; i++) {
        pid = fork();
        if (pid < 0) {
            perror("fork");
            exit(1);
        }

        if (pid == 0) {
            printf("This is the child process %d \t\t--> ", pid);
            printf("Count = %d\n", ++count);
        } else {
            printf("This is the parent process %d \t--> ", pid);
            printf("Count = %d\n", ++count);
            wait(NULL);
        }
    }

    return 0;
}
