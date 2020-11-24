
import numpy as np
#numero de pruebas
import matplotlib.pyplot as plt
import time

n=np.logspace(4,3.3,4, dtype=np.int64)


error=[]
tiempo=[]

plt.figure(figsize=(5,10))

plt.suptitle('Representacion Gráfica\n de Lanzamientos',fontsize=14)

for k,i in enumerate(n[::-1]):
    j= np.random.random((i, 2))   
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<=1
    bb=condi1.sum()
    pi= 4*bb/i
    t2=time.time()
    a1=np.ma.masked_where(z<1, z)
    a2=np.ma.masked_where(z>=1, z)

    plt.subplot(2,2,k+1)
    plt.title('%d Lanzamientos \n %d en el circulo'%(i,bb),fontsize=9)
    plt.scatter(j[:,0], j[:,1], s=a1)
    plt.scatter(j[:,0], j[:,1], s=a2)
    plt.xticks([])
    plt.yticks([])
    plt.ylabel(r'$\pi=%.4f$'%pi)
    plt.xlim(0,1)
    plt.ylim(0,1)

plt.subplots_adjust(hspace = 0.3 ,wspace = 0.25,top=0.8)
plt.show()
