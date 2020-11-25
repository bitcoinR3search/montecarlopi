
import matplotlib.pyplot as plt
import numpy as np  
import os
import matplotlib as mpl 
params = {'xtick.labelsize': 20, 'ytick.labelsize': 20}
mpl.rcParams.update(params)


def nombres(txt):
	if txt[0]=='N':

		N=float(txt[1:10])
		
		if txt[11]=='k':
			k=int(txt[12:15])			
	else:
		N=0
		k=0
		print('Mala terminologia binario: '+txt)
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





def errores(N):
	''' se grafican los errores de los binarios de un conjunto
	N de datos evaluados k veces
	'''



	contenido = os.listdir('binaries/')
	plt.figure(2,figsize=(15,10))
	
	
	pi_l_e,	pi_lb_e,aux=[],[],[]

	for txt in contenido:
		a=txt[1:10]
		aux.append(float(a))
		path='binaries/'+txt
		data = np.load(path,allow_pickle=True)
		pi_l = data['arr_0']
		pi_lb= data['arr_1']
		pi_l_e.append(100*(np.pi-pi_l[0])/np.pi)
		pi_lb_e.append(100*(np.pi-pi_lb[0])/np.pi)


	ind=[]
	for i in np.sort(N):        #se crea un vector de indices ordenado
		auxi='%.3e'%i
		ind.append(float(auxi))
		io=np.array(ind)


	ax=[]
	for ij in aux:
		k=np.where(io==ij)
		ax.append(k)
	indices_=np.array(ax)
	indices=indices_[:,0,0]

#el vector indices nos muestra el orden relativo que
#se obtiene al recuperar valores de error

# las variables pi_l_e y pi_lb_e recuperan los valroes
# de los binarios en desorden, para graficarlos adecuadamente
# 

#Laplace

	plt.semilogx(io[indices],pi_l_e,'ob',label='Buffon')
	plt.title('Error:  Pi estimado vs Número de Lanzamientos',fontsize=18)
	plt.xlabel('N agujas lanzadas', fontsize=18)
	plt.ylabel('Error Porcentual Pi', fontsize=18)	
#laplace Buffon
	plt.semilogx(io[indices],pi_lb_e,'or',label='Laplace-Buffon')
	plt.legend(prop={'size': 16})
	plt.grid()
	plt.savefig("images/Errores.jpg")	
	plt.close(2)
	



if __name__=='__main__':

	N=np.logspace(10,2,50,endpoint=True,dtype=np.int64) #Para generar un valor N distanciado log
	N_jp=N[10:50:1]
	errores(N_jp)

	
