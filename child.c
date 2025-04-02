#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int n;
    printf("Enter the value of n: ");
    scanf("%d", &n);

    int fd1[2], fd2[2];  // Pipes for interprocess communication
    pipe(fd1);
    pipe(fd2);

    pid_t child1 = fork();  // First child

    if (child1 == 0) {
        // First child process
        close(fd1[0]);  // Close reading end of pipe
        int sum1 = 0;
        for (int i = 1; i <= n / 2; i++) {
            sum1 += i;
        }
        write(fd1[1], &sum1, sizeof(sum1));  // Send sum to parent
        close(fd1[1]);  // Close writing end
        exit(0);
    }

    pid_t child2 = fork();  // Second child

    if (child2 == 0) {
        // Second child process
        close(fd2[0]);  // Close reading end of pipe
        int sum2 = 0;
        for (int i = (n / 2) + 1; i <= n; i++) {
            sum2 += i;
        }
        write(fd2[1], &sum2, sizeof(sum2));  // Send sum to parent
        close(fd2[1]);  // Close writing end
        exit(0);
    }

    // Parent process
    close(fd1[1]);  // Close writing ends
    close(fd2[1]);

    int sum1, sum2;
    wait(NULL);  // Wait for first child
    read(fd1[0], &sum1, sizeof(sum1));  // Read first sum

    wait(NULL);  // Wait for second child
    read(fd2[0], &sum2, sizeof(sum2));  // Read second sum

    close(fd1[0]);
    close(fd2[0]);

    printf("Sum from 1 to %d: %d\n", n / 2, sum1);
    printf("Sum from %d to %d: %d\n", (n / 2) + 1, n, sum2);
    printf("Total sum from 1 to %d: %d\n", n, sum1 + sum2);

    return 0;
}
