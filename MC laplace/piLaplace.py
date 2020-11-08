import numpy as np     # para calculos matriciales


# funciones
# Inciso A: problema original de buffon
def buffon(N, l=0.75, b=1.0):
    
    x_cent = np.random.uniform(0,b/2,N)       # centros aleatorios
    theta = np.random.uniform(0,np.pi/2, N)   # angulos aleatorios
    
    x_tip = x_cent - (l/2.0)*np.cos(theta)     # puntas de las agujas
    hits = x_tip < 0    # vector con las agujas que tocan las rayas

    n_hits = np.sum(hits) # acumulacion de los cruces
    
    c = 2.0*l*N        # formula de buffon
    d = b*n_hits
    pi_est = c / d

    return pi_est


if __name__=='__main__':

	print(buffon(100000000))