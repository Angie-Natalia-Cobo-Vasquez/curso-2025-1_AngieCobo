#include "punto_equilibrio.h"

double calcular_punto_equilibrio(double costos_fijos, double precio_unitario, double costo_variable) {
    if (precio_unitario == costo_variable) {
        return -1;
    }
    return costos_fijos / (precio_unitario - costo_variable);
}

