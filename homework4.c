#include <stdio.h>

extern long long int stringlen(char s[]);
extern void stringcpy(char dst[], char src[]);

int main() {
    char src[100];
    char dst[100];

    printf("string : ");
    scanf("%s", src);

    printf("length = %lld\n", stringlen(src));

    stringcpy(dst, src);
    printf("string = %s\n", dst);

    return 0;
}