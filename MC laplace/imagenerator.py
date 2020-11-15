
import matplotlib.pyplot as plt
import numpy as np  
import os



def nombres(txt):
	if txt[0]=='N':

		N=float(txt[1:10])
		
		if txt[11]=='k':
			k=int(txt[12:15])			

	else:
		N=0
		k=0
		print('Mala terminologia')
	return N,k


#'N10e6_k500.npz'
def dibujar(txt):
	N_,k_ = nombres(txt)
	N_=int(N_)
	k_=int(k_)
	path='binaries/'+txt
	data = np.load(path,allow_pickle=True)
	pi_l = data['arr_0']
	pi_lb = data['arr_1']

#Los datos se desempaquetan de la misma forma
# contienen 3 argumentos:
# posicion 0 valor medio
# posicion 1 valor std
# posicion 2 vector de valores k veces estimado

#Para laplace

	plt.figure(1,figsize=(15,10)) 
	plt.subplot(1,2,1)

	yhist, xhist, patches = plt.hist(pi_l[2], 50, density=1, facecolor='b', alpha=0.75, rwidth = 0.9)
	k = 1/(pi_l[1]*np.sqrt(2*np.pi))
	Norm= k*np.exp((-1/2)*((xhist-pi_l[0])/pi_l[1])**2)
	plt.plot(xhist,Norm)
	plt.title('Estimación de '+str(k_)+' valores de Pi \n obtenidas por Laplace lanzando %.0e agujas' % N_ )
	plt.xlabel('valor medio Pi simulado', fontsize=14)
	plt.ylabel('Frecuencia Pi simulado ', fontsize=14)
	plt.grid()

	
#Para laplace Buffon
	plt.subplot(1,2,2)

	yhist1, xhist1, patches1 = plt.hist(pi_lb[2], 50, density=1, facecolor='b', alpha=0.75, rwidth = 0.9)

	k = 1/(pi_lb[1]*np.sqrt(2*np.pi))
	Norm= k*np.exp((-1/2)*((xhist1-pi_lb[0])/pi_lb[1])**2)

	plt.plot(xhist1,Norm)
	plt.title('Estimación de '+str(k_)+' valores de Pi \n obtenidas por Laplace-Buffon lanzando %.0e agujas'%N_)
	plt.xlabel('valor medio Pi simulado', fontsize=14)
	plt.ylabel('Frecuencia Pi simulado ', fontsize=14)
	plt.grid()
	plt.savefig("images/histograms/pi_N%.3ek%d.jpg"%(N_,k_),bbox_inches='tight')
	plt.close(1)



def errores(N,k):
	''' se grafican los errores en conjunto'''

	_N=N
	_k=k


	contenido = os.listdir('binaries/')

	plt.figure(2,figsize=(15,10))

	pi_l_e=[]
	pi_lb_e=[]
	


	for txt in contenido:
		path='binaries/'+txt
		data = np.load(path,allow_pickle=True)
		pi_l = data['arr_0']
		pi_lb= data['arr_1']
		pi_l_e.append(np.pi-pi_l[0])
		pi_lb_e.append(np.pi-pi_lb[0])

#Laplace
	
	plt.subplot(1,2,1)


	plt.plot(_N,pi_l_e,'-*')
	plt.title('Error:  Pi_real-Pi_estimado \nMétodo de Laplace',fontsize=11)
	plt.xlabel('N agujas lanzadas', fontsize=11)
	plt.ylabel('Frecuencia Pi', fontsize=11)	
	plt.grid()

#laplace Buffon

	plt.subplot(1,2,2)

	plt.plot(_N,pi_lb_e,'-*')
	plt.title('Error:  Pi_real-Pi_estimado \nMétodo de Laplace Buffon',fontsize=11)
	plt.xlabel('N agujas lanzadas', fontsize=11)
	plt.ylabel('Frecuencia Pi simulado ', fontsize=11)	
	plt.grid()
	plt.tight_layout(pad=0.4, w_pad=0.5, h_pad=1.0)
	plt.savefig("images/Errores.jpg", bbox_inches='tight')	
	

	plt.close(2)

if __name__=='__main__':

	print('hola')
