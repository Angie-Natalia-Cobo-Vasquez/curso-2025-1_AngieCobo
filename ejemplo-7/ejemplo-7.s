
.text
.global suma_float

# Para los floats se utilizan los registros xmm
# Segun System V:
# xmm0 funcion (xmm0, xmm1, xmm2, ...) en ensamblador
# float funcion (float1, float2, float3, ....) en C

suma_float:
	addss %xmm1, %xmm0	# xmm0 = xmm0 + xmm1
	ret

# addss: Add Scalar Single Precision (Sumar un escalar de presicion simple)
