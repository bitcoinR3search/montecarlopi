import numpy as np 

import piLaplace as piL
import piLaplaceBuffon as piLB 



def S_pi_buffon(N,k=100,l=0.75,b=1.0):
	pi_b=[]
	for _ in range(k):
		pi_est = piL.buffon(N,l,b)
		pi_b.append(pi_est)
	return np.mean(pi_b), np.std(pi_b),pi_b

def S_pi_buffon_laplace(N,k=100,l=0.75,a=1.5,b=1.0):
	pi_bl=[]
	for _ in range(k):
		pi_est = piLB.buffon_laplace(N,l,a,b)
		pi_bl.append(pi_est)
	return np.mean(pi_bl), np.std(pi_bl),pi_bl


def results(N,k,l=0.75,a=1.5,b=1.0):
	# la funcion estadistica para ambos casos devuelve las mismas variables
	# mean,std,pi_* donde pi_* es una lista que contiene los valores estimados
	# de pi para cada (k) prueba de N lanzamientos. 
	# Esta lista se puede gráficar en histograma para mostrar que toma una
	# distribucion normal 
	a1_mean,a1_std,a1_pi=S_pi_buffon(N,k,l,b)
	a2_mean,a2_std,a2_pi=S_pi_buffon_laplace(N,k,l,a,b)
	#Para graficar estas, usaremos otro programa
	#pero en este demostraremos como almacenar 
	#resultados en binarios.

	#el nombre se compone asi:
	#pi_: l (laplace) o lb (laplace buffon)
	pi_l = [a1_mean,a1_std,a1_pi]
	pi_lb = [a2_mean,a2_std,a2_pi]

	#el nombre del binario expresa el N y k usado
	np.savez('binaries/N%.3e_k%d'%(N,k),pi_l,pi_lb)
	#con este binario se procede al 'graficamiento' 



if __name__=='__main__':
	results(10**2,500)