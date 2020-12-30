# -*- coding: utf-8 -*-
"""
Created on Fri Nov 13 12:27:04 2020

@author: UnseR
"""


import numpy as np
import matplotlib.pyplot as plt
 #k es el exponente de 10, l es la cantidad de datos a graficar
n=np.logspace(6,4,200) #varios datos que van creciendo logaritmicamente


error, piv =[], []


for i in (n):
    j= np.abs(np.random.normal(0.27,0.5,(int(i), 2))) #distribucion normal con 0.27 media y 0.5 varianza
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    piv.append(pi)

error1, piv1 =[], []

for i in (n):
    j= np.abs(np.random.random((int(i), 2))) #distribucion uniforme entre 0 y 1
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error1.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    piv1.append(pi)

error2, piv2 =[], []

for i in (n):
    j= np.abs(np.random.exponential(0.42, (int(i), 2))) #distribucion exponencial con parametro 0.42
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error2.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    piv2.append(pi)

#los parametros que escogi para las distribuciones fueron abase de prueba y error
plt.figure(1)
plt.title('Comparación de distribuciones')
plt.semilogx(n,error,'g', label='normal')
plt.semilogx(n,error1,'r', label='uniforme')
plt.semilogx(n,error2,'b', label='exponencial')
plt.ylabel('Error porcentual')
plt.xlabel('Número de lanzamientos')
plt.grid()
plt.legend()
plt.show()
plt.close(1)

plt.figure(2)

piva =[]
for _ in range(300):
    j= np.abs(np.random.normal(0.27,0.5,(int(100000), 2))) #distribucion normal con 0.27 media y 0.5 varianza
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<=1
    bb=condi1.sum()
    pi= 4*bb/100000
    piva.append(pi)


yhist, xhist, patches = plt.hist(piva, 35, density=1, facecolor='b', alpha=0.75, rwidth = 0.9,label='Histograma de valores de Pi')

#que te parece usar un metodo mas numerico y visible
#para ejemplificar la curva normal?
k = 1/(np.std(piva)*np.sqrt(2*np.pi))
Norm= k*np.exp((-1/2)*((xhist-np.mean(piva))/np.std(piva))**2)

plt.plot(xhist,Norm,'--r',label='Ajuste Gaussiano: ' r'$\mu= %.5f ,\ \sigma= %.5f$'%(np.mean(piva),np.std(piva)))
plt.title('Pi estimado por Monte Carlo con distribución Normal:  \n 300 repeticiones del experimento con 1e5 lanzamientos')

plt.xlabel('valor PI', fontsize=12)
plt.ylabel('Probabilidad', fontsize=12)
plt.legend(loc="upper left",prop={'size': 6.5}) 

plt.grid()
plt.show()
plt.close(2)




plt.figure(3)
piva =[]
for _ in range(300):
    j= np.abs(np.random.random((int(100000), 2))) 
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<=1
    bb=condi1.sum()
    pi= 4*bb/100000
    piva.append(pi)


yhist, xhist, patches = plt.hist(piva, 35, density=1, facecolor='b', alpha=0.75, rwidth = 0.9,label='Histograma de valores de Pi')

#que te parece usar un metodo mas numerico y visible
#para ejemplificar la curva normal?
k = 1/(np.std(piva)*np.sqrt(2*np.pi))
Norm= k*np.exp((-1/2)*((xhist-np.mean(piva))/np.std(piva))**2)

plt.plot(xhist,Norm,'--r',label='Ajuste Gaussiano: ' r'$\mu= %.5f ,\ \sigma= %.5f$'%(np.mean(piva),np.std(piva)))
plt.title('Pi estimado por Monte Carlo con distribución Uniforme:  \n 300 repeticiones del experimento con 1e5 lanzamientos')

plt.xlabel('valor PI', fontsize=12)
plt.ylabel('Probabilidad', fontsize=12)
plt.legend(loc="upper left",prop={'size': 6.5}) 

plt.grid()
plt.show()
plt.close(3)


plt.figure(3)
piva =[]
for _ in range(300):
    j= np.abs(np.random.exponential(0.42, (int(100000), 2))) #distribucion exponencial con parametro 0.42
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<=1
    bb=condi1.sum()
    pi= 4*bb/100000
    piva.append(pi)


yhist, xhist, patches = plt.hist(piva, 35, density=1, facecolor='b', alpha=0.75, rwidth = 0.9,label='Histograma de valores de Pi')

#que te parece usar un metodo mas numerico y visible
#para ejemplificar la curva normal?
k = 1/(np.std(piva)*np.sqrt(2*np.pi))
Norm= k*np.exp((-1/2)*((xhist-np.mean(piva))/np.std(piva))**2)

plt.plot(xhist,Norm,'--r',label='Ajuste Gaussiano: ' r'$\mu= %.5f ,\ \sigma= %.5f$'%(np.mean(piva),np.std(piva)))
plt.title('Pi estimado por Monte Carlo con distribución Exponencial:  \n 300 repeticiones del experimento con 1e5 lanzamientos')

plt.xlabel('valor PI', fontsize=12)
plt.ylabel('Probabilidad', fontsize=12)
plt.legend(loc="upper left",prop={'size': 6.5}) 

plt.grid()
plt.show()
plt.close(3)