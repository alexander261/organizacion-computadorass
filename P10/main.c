#include <stdint.h>
#include <stdio.h>

extern int suma(int x,int y);
extern int strlen (char *str);
extern int getBit( int value, int numbit);


int main(){

    int x = 1;
    int y = 2;
    int total = suma(x,y);    
    

    printf("\n SUMA: %d \n",total);

    char palabra[]="12345";
    int count = strlen(palabra);

    printf("\n LOGITUD: %d \n",count);

    int valor = 1;
    int numbit = 4;
    int statusGetBit = getBit(valor,numbit);
    printf("\n STATUS BIT: %d \n",statusGetBit);


    return 0;
}
