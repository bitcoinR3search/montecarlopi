# -*- coding: utf-8 -*-
"""
Created on Fri Oct 30 10:02:29 2020

@author: UnseR
"""

import numpy as np
import matplotlib.pyplot as plt
import time
import random


n=[100, 200, 300, 1000, 2000, 3000, 10000, 20000] #varios datos que van creciendo
error=[]
disc=[]
tiempo=[]
piv=[]

for i in (n):
    t1=time.time()
    j= np.random.random((int(i), 2))   
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    disc.append(pi-np.pi) #discrepancia respecto al valor de referencia
    t2=time.time()
    tiempo.append(t2-t1)
    piv.append(pi)
plt.subplot(2,1,1)
plt.plot(n, error, 'g')
plt.xlabel('n')
plt.ylabel('error')
plt.subplot(2,1,2)
plt.plot(n, disc, 'r')
plt.xlabel('n')
plt.ylabel('discrepancia')
plt.show()
#en los dos graficos a mediada que n crece ambos errores tienden a 0