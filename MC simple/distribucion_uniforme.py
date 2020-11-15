import montepi
import numpy as np 
import matplotlib.pyplot as plt
from errors import errors_data

import matplotlib as mpl



"""
	En este programa se pretende demostrar que el generador de números
	pseudoaleatorio que utiliza numpy en python: Mersenne Twister (MT19937)
	tiene el mismo comportamiento al variar las semillas. Mostrar el que valor 
	de pi converge de igual forma para distintas generaciones aleatorias.

"""

seed=np.linspace(0,100,15,dtype=np.int32)
k=1000000
l=30
QA=np.logspace(np.log10(k),2,l)
mpl.style.use('seaborn')
plt.title('Error absoluto de Pi simulado vs N lanzamientos')
plt.xlabel('N lanzamientos en escala log')
plt.ylabel('Error porcentual')

for j,i in enumerate(seed):
	np.random.seed(i)
	_,a=errors_data(k,l)
	plt.semilogx(QA,a,label='seed= %d'%(j+1))

plt.legend(prop={'size': 5}) 

plt.show()

