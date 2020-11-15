
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
el valor n usado (por defecto 1e4) y el tiempo que demora en realizar la simulación
 	"""
#	t1=time()
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
#	t2=time()
#	tiempo=t2-t1

#ademas de los dos returns de pi y tiempo, se devolvera el vector J
#para graficar su distribición OJO!
	return pi_est

def stats(n=10000,m=100):
	""" 
		Esta función repite el calculo
		de pi mediante la funcion mcpi() varias veces, para hacer una estadistica
		de los valores del error y tiempo de computo
	"""
#	tmp=[]
	_pi_est=[]
	for _ in range(m):
		pi_est=mcpi(n)
		_pi_est.append(pi_est)
	#print('Tiempo de computo: '+str(np.mean(tmp))+' segundos para cada montecarlo')
	#print('Tiempo de computo TOTAL: '+str(np.sum(tmp))+' segundos, con %d repeticiones'%m)
	
	return np.mean(_pi_est),np.std(_pi_est)


if __name__ == "__main__":
	pi,stdpi=stats(10000,500)

	print(pi)
	print(stdpi)
