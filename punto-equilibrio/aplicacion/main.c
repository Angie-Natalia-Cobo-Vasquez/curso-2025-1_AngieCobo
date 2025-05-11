#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main() {
    double (*calcular)(double, double, double);
    void *handle = dlopen("../libequilibrio/libequilibrio.so", RTLD_LAZY);

    if (!handle) {
        fprintf(stderr, "Error al cargar la librería: %s\n", dlerror());
        return 1;
    }

    calcular = dlsym(handle, "calcular_punto_equilibrio");

    if (!calcular) {
        fprintf(stderr, "No se encontró la función: %s\n", dlerror());
        return 1;
    }

    double cf, pv, cv;
    printf("===========================================\n");
    printf("     CALCULADORA DE PUNTO DE EQUILIBRIO    \n");
    printf("===========================================\n");

    printf("Ingrese el COSTO FIJO: ");
    scanf("%lf", &cf);
    printf("Ingrese el PRECIO DE VENTA UNITARIO: ");
    scanf("%lf", &pv);
    printf("Ingrese el COSTO VARIABLE UNITARIO: ");
    scanf("%lf", &cv);

    double resultado = calcular(cf, pv, cv);
    if (resultado < 0) {
        printf("¡Error! El precio unitario no puede ser igual al costo variable.\n");
    } else {
        printf("Punto de equilibrio: %.2f unidades\n", resultado);
    }

    dlclose(handle);
    return 0;
}

