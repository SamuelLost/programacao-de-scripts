#include <stdio.h>

int main() {
    int num;
    char str[100];
    int i = 0;
    // Lê os números do arquivo fornecido pela entrada padrão
    while (scanf("%s", str) == 1) {
        printf("Número lido: %s\n", str);
        i++;
    }

    return 0;
}
