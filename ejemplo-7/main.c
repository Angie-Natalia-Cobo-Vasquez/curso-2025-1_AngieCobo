#include <stdio.h>
#include <stdlib.h>

float suma_float(float, float);

int main (int args, char ** argumentos) {
	float numero1 = 0.56F;
	float numero2 = 0.44F;
	float resultado;
	resultado = suma_float(numero1, numero2);
	printf("\r\n%f + %f = %f\r\n", numero1, numero2, resultado);
	return 0;
}
