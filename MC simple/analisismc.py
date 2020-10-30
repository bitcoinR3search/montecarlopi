import montepi as mcpi
import numpy as np

err=[]
tmp=[]
pimc=[]
for i in range(1000):
	pi,error,tiempo=mcpi.mcpi(100000)
	err.append(error)
	tmp.append(tiempo)
	pimc.append(pi)
	mean_err=np.mean(err)
	std_err=np.std(err)
	mean_tmp=np.mean(tmp)
	std_tmp=np.std(tmp)

import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
from scipy.stats import norm

yhist, xhist, patches = plt.hist(pimc, 30, density=1, facecolor='b', alpha=0.75, rwidth = 0.9)
plt.grid(True)
y = norm.pdf(xhist, np.mean(pimc), np.std(pimc))

plt.plot(xhist, y, "r--", linewidth=2)
plt.xlabel('valor IQ', fontsize=14, color='b')

plt.ylabel('Probabilidad', fontsize=14)

plt.show()