import random
import math
import time as t
#no se necesita numpy
def buffon(n,r,a,b):
    data=[]
    print( 'Buffon Needle Experiment (Google it) ') 
    print( 'Runs       Number Hits  estimate of pi')
    for jj in range(r):  
        nhits = 0
        for ii in range(n): 
            xcent = random.uniform(0,b/2.0)
            theta = random.uniform(0,math.pi/2)
            xtip  = xcent - (a/2.0)*math.cos(theta)  #use of cosine not historically accurate
            if xtip < 0 :
                nhits += 1
        #print str(jj)+'            '+str(nhits)+'               '+str((6.0/a*float(b))*nhits/n)
        c = 2.0*a*n
        d = b*nhits
        print( str(jj)+'            '+str(nhits)+'               '+str(c/d))
        data.append([jj,nhits])
    return data
    
t1=t.time()  
n=4000  
z=buffon(n,5,2,2) #prueba de la funcion
t2=t.time()
t3=t2-t1

print(z)
print('Para n=' +str(n) + ' demora ' +str(t3) + 'seg')

#sugiero añadir una variable que mida el tiempo de ejecucion
#y que guarde el dato en relación con el n 

#Para empezar podriamos hacer de n un vector [10**2 10**3 10**4 10**5 10**6]
#que tenga un vector de los tiempos de ejecucion [t1 t2 t3 t4 t5]
#y graficamos como varia el tiempo de ejecución mientras mas grande es el bucle
#solo es un comentario random