import montepi as mcpi
import numpy as np


"""
Debido a que el resultado que obtenemos de Pi al realizar el experimento MC lanzando N veces no es 
un proceso determinista, se realiza M veces para demostrar que el resultado que arroja la simulación
tiene un comportamiento que se ajusta a una distribución normal.

	De esta forma se puede obtener resultados con mayor certeza. 

"""


pimc=[]
m=3000   #veces que repite el experimento
N=1000000  #lanzamientos de puntos para calcular pi
  
for _ in range(m):
	pi=mcpi.mcpi(N)
	pimc.append(pi)
	
import matplotlib.pyplot as plt
#import matplotlib.mlab as mlab


yhist, xhist, patches = plt.hist(pimc, 35, density=1, facecolor='b', alpha=0.75, rwidth = 0.9,label='Histograma de valores de Pi')

#que te parece usar un metodo mas numerico y visible
#para ejemplificar la curva normal?
k = 1/(np.std(pimc)*np.sqrt(2*np.pi))
Norm= k*np.exp((-1/2)*((xhist-np.mean(pimc))/np.std(pimc))**2)

plt.plot(xhist,Norm,'--r',label='Ajuste Gaussiano: ' r'$\mu= %.5f ,\ \sigma= %.5f$'%(np.mean(pimc),np.std(pimc)))
plt.title('Pi estimado por Monte Carlo:  \n %d repeticiones del experimento con %d lanzamientos'%(m,N))

plt.xlabel('valor PI', fontsize=12)
plt.ylabel('Probabilidad', fontsize=12)
plt.legend(loc="upper left",prop={'size': 6.5}) 

plt.grid()
plt.show()