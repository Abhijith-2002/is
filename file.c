#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>

#define BUFFER_SIZE 1024

int main() {
    char in_file[100],out_file[100];
    printf("\nEnter input file name : ");
    scanf("%s",in_file);
    printf("\nEnter output file name : ");
    scanf("%s",out_file);

    int fin = open(in_file,O_RDONLY);
    int fout = open(out_file,O_WRONLY | O_CREAT | O_TRUNC, 0644);
    
    char buffer[BUFFER_SIZE];
    int bytes_read;
    while((bytes_read=read(fin,buffer,BUFFER_SIZE))>0) {
        write(fout,buffer,bytes_read);
    }

    close(fin);
    close(fout);
    printf("Success!");
    return 0;
}