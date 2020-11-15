# -*- coding: utf-8 -*-
"""
Created on Fri Nov 13 12:27:04 2020

@author: UnseR
"""


import numpy as np
import matplotlib.pyplot as plt
 #k es el exponente de 10, l es la cantidad de datos a graficar
n=np.logspace(6,2,200) #varios datos que van creciendo logaritmicamente
error, disc, piv =[], [], []
for i in (n):
    j= np.abs(np.random.normal(0.5,0.25,(int(i), 2))) #distribucion normal con 0.27 media y 0.5 varianza
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    disc.append(pi-np.pi) #discrepancia respecto al valor de referencia
    piv.append(pi)
error1, disc1, piv1 =[], [], []
for i in (n):
    j= np.abs(np.random.random((int(i), 2))) #distribucion uniforme entre 0 y 1
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error1.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    disc1.append(pi-np.pi) #discrepancia respecto al valor de referencia
    piv1.append(pi)
error2, disc2, piv2 =[], [], []
for i in (n):
    j= np.abs(np.random.exponential(0.42, (int(i), 2))) #distribucion exponencial con parametro 0.42
    z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
    condi1=z<1
    bb=condi1.sum()
    pi= 4*bb/i
    error2.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
    disc2.append(pi-np.pi) #discrepancia respecto al valor de referencia
    piv2.append(pi)
#los parametros que escogi para las distribuciones fueron abase de prueba y errror
plt.semilogx(n,disc,'g')
plt.semilogx(n,disc1,'r')
plt.semilogx(n,disc2,'b')
plt.ylabel('discrepancia')
plt.xlabel('azul=exp, rojo=unif, verde=norm')
plt.grid()
plt.show()
