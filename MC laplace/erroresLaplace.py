# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 13:52:21 2020

@author: UnseR
"""
import numpy as np
import matplotlib.pyplot as plt

def errors(k=5,l=100):
    N=np.logspace(2,k,l)
    error=[]
    disc=[]
    piv=[]
    for i in (N):
        x=np.random.uniform(0,1,int(i))
        y=np.random.uniform(0,1.5,int(i))
        theta=np.random.uniform(0, np.pi/2, int(i))
        x1=x+(0.75/2.0)*np.cos(theta)
        x2=x-(0.75/2.0)*np.cos(theta)
        y1=y+(0.75/2.0)*np.sin(theta)
        y2=y-(0.75/2.0)*np.sin(theta)
        hx1=x1>=1   	#condicional de corte en eje x  positivo
        hx2=x2<=0	#condicional de corte en eje x  negativo
        nhx = np.logical_or(hx1,hx2)
        hy1=y1>=1.5 			#condicional de corte en eje y positivo
        hy2=y2<=0			#condicional de corte en eje y negativo
        nhy = np.logical_or(hy1,hy2)
        hits=np.logical_or(nhx,nhy)
        nhits=np.sum(hits)
        pi_est=(2*0.75*(2.5)-(0.75*0.75))*int(i)/(1.5*nhits)
        error.append(100*(pi_est-np.pi)/np.pi) #error porcentual respecto al valor de referencia
        disc.append(pi_est-np.pi) #discrepancia respecto al valor de referencia
        piv.append(pi_est)
    plt.subplot(2,1,1)
    plt.plot(N, error, 'g')
    plt.xlabel('n')
    plt.ylabel('error')
    plt.subplot(2,1,2)
    plt.plot(N, disc, 'r')
    plt.xlabel('n')
    plt.ylabel('discrepancia')
    plt.show()