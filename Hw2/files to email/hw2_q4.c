#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

int main( int argc, char *argv[] )
{
    char msg[]="Hello hola how are you";
    int i;
    int msg_size = sizeof(msg);
    int file_end;
    // Open a file for writing,create if not exist
    int fd = open( "Output.txt", O_RDWR | O_CREAT | O_TRUNC , S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH | S_IWGRP | S_IWOTH);
    if (fd == -1)   {
        perror("Error: file cannot be opened!");
        exit(0);
    }
    // write to Null
    file_end = lseek(fd, msg_size - 2 , SEEK_SET);
    write( fd , "", 1);
    // mapping file
    void *map = mmap(0, msg_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (map == MAP_FAILED)    {
        close(fd);
        perror("Error: cannot mmap to file");
        exit(0);
    }
    // write message to file
    strcpy( map , msg);
    printf("Message written to file successfully!\n");
    // free mmapped memory
    if (munmap(map, msg_size) == -1) {
        perror("Error: cannot ummapped memory!");
    }
    close(fd);
    return 0;
}