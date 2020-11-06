import montepi as mcpi
import numpy as np

err=[]
tmp=[]
pimc=[]
for i in range(1000):
	pi,error,tiempo=mcpi.mcpi(100000)
	err.append(error)
	tmp.append(tiempo)
	pimc.append(pi)
	mean_err=np.mean(err)
	std_err=np.std(err)
	mean_tmp=np.mean(tmp)
	std_tmp=np.std(tmp)

import matplotlib.pyplot as plt
import matplotlib.mlab as mlab


yhist, xhist, patches = plt.hist(pimc, 30, density=1, facecolor='b', alpha=0.75, rwidth = 0.9)

#que te parece usar un metodo mas numerico y visible
#para ejemplificar la curva normal?
k = 1/(np.std(pimc)*np.sqrt(2*np.pi))
Norm= k*np.exp((-1/2)*((xhist-np.mean(pimc))/np.std(pimc))**2)

plt.plot(xhist,Norm)
plt.xlabel('valor IQ', fontsize=14, color='b')
plt.ylabel('Probabilidad', fontsize=14)
plt.grid()
plt.show()