# -*- coding: utf-8 -*-
"""
Created on Tue Nov 10 20:10:09 2020

@author: Alienware
"""

import numpy as np
import matplotlib.pyplot as plt
from montepi import mcpi,stats

def errors(k=10000,l=300): #k es el numero maximo de tiradas y l es la cantidad de datos a graficar
    n=np.linspace(100,k,l,dtype=np.int64) #varios datos que van creciendo linealmente
    k1=np.log10(k)
    n1=np.logspace(2,k1,l,dtype=np.int64) #varios datos que van creciendo logaritmicamente
    error=[]
    error1=[]
    for i,j in zip(n,n):
        pi,_= stats(i,10)
        pi1,_=stats(j,10)
        error.append(100*np.abs(pi-np.pi)/np.pi) #error porcentual respecto al valor de referencia
        error1.append(100*np.abs(pi1-np.pi)/np.pi) #error porcentual respecto al valor de referencia
        
    plt.subplot(2,1,1)
    plt.title('Error vs Número de lanzamientos')
    plt.plot(n, error, 'g')
    plt.xlabel('N lanzamientos')
    plt.ylabel('Error porcentual')
    plt.grid()
    plt.subplot(2,1,2)
    plt.semilogx(n1, error1, 'r')
    plt.xlabel('N lanzamientos en escala log')
    plt.ylabel('Error porcentual')
    plt.grid()
    plt.tight_layout(pad=0.4, w_pad=0.5, h_pad=1.0)
    plt.show()

def errors_data(k=10000,l=300): #k es el numero maximo de tiradas y l es la cantidad de datos a graficar
    n=np.linspace(100,k,l,dtype=np.int64) #varios datos que van creciendo linealmente
    k1=np.log10(k)
    n1=np.logspace(k1,2,l,dtype=np.int64) #varios datos que van creciendo logaritmicamente
    error=[]
    error1=[]
    for i,j in zip(n,n1):
        pi,_= stats(i,20)
        pi1,_=stats(j,20)
        error.append(np.pi-pi) #error porcentual respecto al valor de referencia
        error1.append(np.pi-pi1) #error porcentual respecto al valor de referencia
    return error,error1

if __name__=='__main__':

    N=np.logspace(4,2,10)
    print(N)