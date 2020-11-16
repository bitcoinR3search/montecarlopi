
import numpy as np
#numero de pruebas
import matplotlib.pyplot as plt
import time

n=np.logspace(2,4,4, dtype=np.int64)
print(n)
plt.plot(n)
plt.grid()
error=[]
tiempo=[]
plt.figure(figsize=(15,15))

for k,i in enumerate(n):
    t1=time.time()
    j= np.random.random((i, 2))   
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error.append(100*abs(pi-np.pi)/np.pi)
    t2=time.time()
    a1=np.ma.masked_where(z<1, z)
    a2=np.ma.masked_where(z>=1, z)
    plt.subplot(2,2,k+1)
    plt.scatter(j[:,0], j[:,1], s=a1)
    plt.scatter(j[:,0], j[:,1], s=a2)
plt.show()