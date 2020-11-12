import numpy as np     # para calculos matriciales
import random


semilla=2020

np.random.seed(semilla)
a = np.random.uniform(0,100,5)

for i in range(2):

	np.random.seed(semilla+1)
	b = np.random.uniform(0,100,5)
	print(b)

print(a)
print(b)