# -*- coding: utf-8 -*-
"""
@author: LImber
"""

import numpy as np
from time import time
def kusillo(N, l=0.75, b=1.0):
    t1=time()
    D=np.random.rand(N)*b/2
    O=np.random.rand(N)*np.pi/2
    D1=D[D<l/2]
    O1=O[D<l/2]
    Oc=np.arcsin(2*D1/l)
    E=O1[O1>=Oc]
    P=len(E)/len(D)
    #print(f'estimado por monti: {P}')
    #PR=2*l/(np.pi*b)
    #print(f'valor real: {PR}')
    pi=2*l/(P*b)
    #print(f'el valor de pi es: {pi}')
    t2=time()
    t3=t2-t1
    return pi, t3

a=np.linspace(10**2,10**7,10,endpoint=True,dtype=np.int32)
vkus=np.vectorize(kusillo)
_,tiempo = vkus(a)


