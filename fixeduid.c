#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

uid_t getuid(void) {
    printf("Return uid - 0\n");
    return 0;
}

uid_t geteuid(void) {
	printf("Return euid - 0\n");
	return 0;
}

int seteuid(uid_t euid) {
	printf("seteuid - 0\n");
	return 0;
}