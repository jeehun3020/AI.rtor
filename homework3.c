#include <stdio.h>

extern long long int arraymax(long long int a[], long long int n);

int main(){
    long long int a[1000], n;

    printf("n : ");
    scanf("%lld", &n);

    for(long long int i = 0; i < n; i++) {
        printf("a[%lld] : ", i);
        scanf("%lld", &a[i]);
    }

    printf("max = %lld\n", arraymax(a,n));

    return 0;
}