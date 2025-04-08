#include<stdio.h>
#include<stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int n,child_1,child_2,sum,sum1,sum2;
    printf("Enter value of n : ");
    scanf("%d",&n);
    int fd1[2],fd2[2];
    pipe(fd1);
    pipe(fd2);
    child_1 = fork();
    if(child_1==0) {
        sum = 0;
        close(fd1[0]);
        printf("Executing on child-1 with process id : %d",getpid());
        for(int i=0;i<=n/2;i++) {
            sum+=i;
        }
        write(fd1[1],&sum,sizeof(sum));
        close(fd1[1]);
        exit(0);
    }
    child_2 = fork();
    if(child_2==0) {
        sum = 0;
        close(fd2[0]);
        printf("Executing on child-2 with process id : %d",getpid());
        for(int i=(n/2)+1;i<=n;i++) {
            sum+=i;
        }
        write(fd2[1],&sum,sizeof(sum));
        close(fd2[1]);
        exit(0);
    }
    close(fd1[1]);
    close(fd2[1]);
    wait(NULL);
    read(fd1[0],&sum1,sizeof(sum1));
    wait(NULL);
    read(fd2[0],&sum2,sizeof(sum2));
    sum = sum1+sum2;
    printf("Sum : %d ",sum);
    return 0;
}