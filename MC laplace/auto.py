
import numpy as np
import matplotlib.pyplot as plt 
import os

import imagenerator
import statsBuff

k=200  # Para obtener el numero de bins para formar histogramas
N=np.logspace(2,5,20,endpoint=True,dtype=np.int64) #Para generar un valor N distanciado log
print(N)

N_jp=N[0:20:2];
N_cc=N[1:20:2];



#generador de los resultados para cada N y k

for i in N_jp:
	statsBuff.results(i,k)


#generador de las imagenes para cada binario
contenido = os.listdir('binaries/')
for txt in contenido:
	imagenerator.dibujar(txt)



#grafica errores

imagenerator.errores(N_jp,k)




