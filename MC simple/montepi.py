
#Declaración de librerias a usar
import numpy as np
import matplotlib.pyplot as plt
from time import time
from datetime import datetime
import random

def mcpi(n=10000):
	"""

Esta función aproxima por el metodo de monte carlo
el valor de Pi, mediante la relacion del area de un cuadrado
con una circunferencia adscrita. 
Tiene un valor de entrada, n que es el numero de veces que se 
realizara el experimento
Devuelve 
el valor n usado (por defecto 10**4), el error de la aproximación con el 
valor de pi mas exacto y el tiempo que demora en realizar la simulación
 n,err, tiempo 
 El método que usa esta función es random.random

	"""
	t1=time()
	#se generan los N lanzamientos
	j=np.random.random((n,2))
	#calculamos la distancia a cada punto generado
	z=np.sqrt(j[:,0]*j[:,0]+j[:,1]*j[:,1])
	#caen en el circulo siempre que sea menor al radio
	circ=z<1 
	AC=circ.sum()
	#todos los puntos caen en el cuadrado
	#entonces el calculo de pi es:
	pi_est=4*AC/n
	#VALORES DE INTERES
	t2=time()
	tiempo=t2-t1
	err= pi_est-np.pi
	return pi_est,err, tiempo

def stats(n=10000,m=10):
	""" 
		Esta función repite el calculo
		de pi mediante la funcion mcpi() varias veces, para hacer una estadistica
		de los valores del error y tiempo de computo
	"""
	err=[]
	tmp=[]
	for i in range(m):
		_,error,tiempo=mcpi(n)
		err.append(error)
		tmp.append(tiempo)
	mean_err=np.mean(err)
	std_err=np.std(err)
	mean_tmp=np.mean(tmp)
	std_tmp=np.std(tmp)
	return mean_err,std_err


statsv=np.vectorize(stats)

if __name__ == "__main__":
	NN=np.logspace(2,6,25,dtype=np.int64)
	A=[]
	for i in range(20):
		random.seed(int(time()))
		a,s = statsv(NN,15)
		A.append(a)
	for i in range(20):
   		plt.plot(A[i])

	plt.grid()
	plt.show()