# -*- coding: utf-8 -*-
"""
Created on Mon Oct 26 11:13:39 2020

@author: Alienware
"""

import numpy as np
import matplotlib.pyplot as plt
b=2
a=2
N=1000
l=1
l1=np.sqrt((a/2)**2+(b/2)**2)
x=np.random.uniform(0,b/2,N)
y=np.random.uniform(0,a/2,N)
z=np.array([x,y])
c=np.sqrt(z[0,:]**2+z[1,:])+0.5
hits=c>l1
n_hits=np.sum(hits)
p=n_hits/N
e=(2*l*(a+b))-(l**2)
f=a*b*p
pi_est=e/f


"""

   en este caso, la representación grafica es mas compleja, pues el punto que estas graficando 
   representa el centro de la aguja, ahi debemos considerar la longitud para cada uno, y dividir 
   el espacio caen para mostrar si cruzan una linea o no
"""

print(pi_est)
plt.scatter(x,y)
plt.show()
