import numpy as np 

import piLaplace as piL
import piLaplaceBuffon as piLB 





def pi_buffon(N,k=100,l=0.75,a=1.5,b=1.0):
	pi=[]
	for _ in range(k):
		pi_est = piL.buffon(N)
		pi.append(pi_est)
	return np.mean(pi), np.std(pi)

def pi_buffon_laplace(N,k=100,l=0.75,a=1.5,b=1.0):
	pi=[]
	for _ in range(k):
		pi_est = piLB.buffon_laplace(N)
		pi.append(pi_est)
	return np.mean(pi), np.std(pi)



if __name__=='__main__':

	print(pi_buffon(N=10000))
	print(pi_buffon_laplace(N=10000))
	