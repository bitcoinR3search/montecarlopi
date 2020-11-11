# -*- coding: utf-8 -*-
"""
Created on Tue Nov 10 20:10:09 2020

@author: Alienware
"""

import numpy as np
import matplotlib.pyplot as plt

def errors(k=5,l=100): #k es el exponente de 10, l es la cantidad de datos a graficar
    n=np.logspace(2,k,l) #varios datos que van creciendo logaritmicamente
    error=[]
    disc=[]
    piv=[]
    for i in (n):
        j= np.random.random((int(i), 2))   
        z= np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
        condi1=z<1
        bb=condi1.sum()
        pi= 4*bb/i
        error.append(100*(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
        disc.append(pi-np.pi) #discrepancia respecto al valor de referencia
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
