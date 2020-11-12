# -*- coding: utf-8 -*-
"""
Created on Mon Oct 26 11:13:39 2020

@author: Alienware
"""

import numpy as np



def buffon_laplace(N,l=0.75,a=1.5,b=1.0):

#b=2         #  eje x
#a=1.7 		#  eje y
#N=100000     #Veces de lanzamiento de aguja
	l=1			#longitud de la aguja
	x=np.random.uniform(0,b,N)
	y=np.random.uniform(0,a,N)
	theta=np.random.uniform(0, np.pi/2, N)

# Creando los puntos para las rectas
	x1=x+(l/2.0)*np.cos(theta)
	x2=x-(l/2.0)*np.cos(theta)

	y1=y+(l/2.0)*np.sin(theta)
	y2=y-(l/2.0)*np.sin(theta)



	hx1=x1>=b   	#condicional de corte en eje x  positivo
	hx2=x2<=0	#condicional de corte en eje x  negativo
	nhx = np.logical_or(hx1,hx2)
	#nhx=np.sum(hx1)+np.sum(hx2)           #suma total de cortes

	#px=nhx/N
	#pi_estx=(2*l)/(b*px)
	#print(pi_estx)

	hy1=y1>=a 			#condicional de corte en eje y positivo
	hy2=y2<=0			#condicional de corte en eje y negativo
	nhy = np.logical_or(hy1,hy2)
	#nhy=np.sum(hy1)+np.sum(hy2)
	#py=nhy/N
	#pi_esty=(2*l)/(a*py)
	#print(pi_esty)
	hits=np.logical_or(nhx,nhy)

	nhits=np.sum(hits)

	#P=px+py-px*py                        #hay q darle un ojo
	pi_est=(2*l*(a+b)-l*l)*N/(a*b*nhits)
	
	return pi_est


if __name__ == '__main__':
	n=100000000
	print('Para '+str(n)+ ' Pi por Buffon LaPlace: '+str(buffon_laplace(n)))

