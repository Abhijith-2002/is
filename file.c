#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>
#define BUFFERSIZE 1024

int main() {
    int bytes_read,fin,fout;
    char infile[100],outfile[100];
    char buffer[BUFFERSIZE];
    printf("Enter input file name : ");
    scanf("%s",infile);
    printf("Enter output file name : ");
    scanf("%s",outfile);
    fin = open(infile,O_RDONLY);
    fout = open(outfile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    while((bytes_read=read(fin,buffer,BUFFERSIZE))>0) {
        write(fout,buffer,bytes_read);
    }
    close(fin);
    close(fout);
    return 0;
}