import numpy as np 
import matplotlib.pyplot as plt

def buffon_historical(N, l=0.75, b=1.0):
    delta_samples = N * 2
    
    x_cent = np.random.uniform(0,b/2,N)
    
    delta_x = np.random.uniform(0,1,delta_samples)
    delta_y = np.random.uniform(0,1,delta_samples)
    
    tau = np.sqrt(np.square(delta_x) + np.square(delta_y))
    good_tau, = np.where(tau < 1)
    idx = good_tau[0:N]
    
    delta_x = delta_x[idx]
    delta_y = delta_y[idx]
    tau = tau[idx]
    #print(tau.shape, delta_x.shape, delta_y.shape)
    
    x_tip = x_cent - (l / 2.0) * delta_x / tau
    
    #print(x_tip)
    
    hits = x_tip < 0
    
    n_hits = np.sum(hits)
    
    c = 2.0*l*N
    d = b*n_hits
    pi_est = c / d

    return pi_est
    
    
def buffon_laplace_historical(N, l=0.75, a=1.5, b=1.0):
    
    delta_samples = N * 2
    
    x_cent = np.random.uniform(0, b/2, N)
    y_cent = np.random.uniform(0, a/2, N)
    
    delta_x = np.random.uniform(0,1,delta_samples)
    delta_y = np.random.uniform(0,1,delta_samples)
    
    tau = np.sqrt(np.square(delta_x) + np.square(delta_y))
    good_tau, = np.where(tau < 1)
    idx = good_tau[0:N]
    
    delta_x = delta_x[idx]
    delta_y = delta_y[idx]
    tau = tau[idx]
    
    x_tip = x_cent - (l/2.0) * delta_x / tau
    
    y_tip = y_cent - (l/2.0) * delta_y / tau
    
    x_hits = x_tip < 0 
    y_hits = y_tip < 0
    
    hits = np.logical_or(x_hits, y_hits)
    
    n_hits = np.sum(hits)
    
    c = (2.0 * l * (a + b) - l * l) * N
    d = a * b * n_hits
    
    pi_est = c / d
    
    return pi_est

def S_pi_buffon_h(N,k=100,l=0.75,b=1.0):
    pi_b=[]
    for _ in range(k):
        pi_est = buffon_historical(N,l,b)
        pi_b.append(pi_est)
    return np.mean(pi_b), np.std(pi_b),pi_b

def S_pi_buffon_laplace_h(N,k=100,l=0.75,a=1.5,b=1.0):
    pi_bl=[]
    for _ in range(k):
        pi_est = buffon_laplace_historical(N,l,a,b)
        pi_bl.append(pi_est)
    return np.mean(pi_bl), np.std(pi_bl),pi_bl


if __name__ == '__main__':
    tt,tt1,_ = S_pi_buffon_h(1000)
    print(tt,tt1)

    xhist=np.linspace(0,6,100)
    k = 1/(tt1*np.sqrt(2*np.pi))
    Norm= k*np.exp((-1/2)*((xhist-tt/tt1)**2))
    plt.plot(xhist,Norm)
    plt.grid()
    plt.show()