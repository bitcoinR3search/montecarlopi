
import numpy as np
import matplotlib.pyplot as plt 
import os

import imagenerator
import statsBuff


k=200  # Para obtener el numero de bins para formar histogramas
N=np.logspace(10,2,50,endpoint=True,dtype=np.int64) #Para generar un valor N distanciado log
N_jp=N[10:50:2]
#
#[10000000000  4714866363  2222996482  1048113134   494171336   232995181
#   109854114    51794746    24420530    11513953     5428675     2559547
#ya     1206792      568986      268269      126485       59636       28117
#ya      13257        6250        2947        1389         655         308
#ya        145]


#N_cc=N[11:50:2];
#
#[6866488450 3237457542 1526417967  719685673  339322177  159985871
#   75431200   35564803   16768329    7906043    3727593    1757510
#     828642     390693     184206      86851      40949      19306
#       9102       4291       2023        954        449        212
#        100]


#generador de los resultados para cada N y k

#statsBuff.results(232995181,k)

'''

for i in N_jp:
	statsBuff.results(i,k)

'''
#generador de las imagenes para cada binario
#contenido = os.listdir('binaries/')
#for txt in contenido:
#	imagenerator.dibujar(txt)



#grafica errores

imagenerator.errores(N_jp,k)



