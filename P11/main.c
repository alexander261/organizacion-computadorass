#include <stdint.h>
#include <stdio.h>

extern void pBin8b (uint8_t dato);

extern void pBin16b (uint16_t dato );
extern void pBin32b (uint32_t dato);
extern void pBin64b (uint64_t dato );


int main(){


    printf("\n");
    pBin8b(8);
    printf("\n");
    pBin16b(8);
    printf("\n");
    pBin32b(8);
    printf("\n");

    return 0;
}