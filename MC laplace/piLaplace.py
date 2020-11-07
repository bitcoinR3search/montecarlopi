# -*- coding: utf-8 -*-
"""
Created on Mon Oct 26 11:13:39 2020

@author: Alienware
"""

import numpy as np
b=2
a=1.7
N=10000
l=1
hx=[]
hy=[]
x=np.random.uniform(0,b,N)
y=np.random.uniform(0,a,N)
theta=np.random.uniform(0, np.pi/2, N)
x1=x+(l/2.0)*np.cos(theta)
x2=x-(l/2.0)*np.cos(theta)
y1=y+(l/2.0)*np.sin(theta)
y2=y-(l/2.0)*np.sin(theta)

hx1=x1>b
hx.append(hx1)
hx2=x2<0
hx.append(hx2)
nhx=np.sum(hx)
px=nhx/N
pi_estx=(2*l)/(b*px)
print(pi_estx)

hy1=y1>a
hy.append(hy1)
hy2=y2<0
hy.append(hy2)
nhy=np.sum(hy)
py=nhy/N
pi_esty=(2*l)/(a*py)
print(pi_esty)

P=px+py-px*py
pi_est=(2*l*(a+b)-l**2)/(a*b*P)
print(pi_est)
