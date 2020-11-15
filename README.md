# El método de MONTE CARLO 

En este estudio se pretende mostrar una aproximación del uso del método
monte carlo para aproximar el valor de Pi por dos métodos:
- Relación de áreas de circunferencia y cuadrado.
- Aplicando el método de Laplace y su extensión de Buffon
        - Considerar la corrección histórica. 

# ¿Qué resultados se pretenden obtener?

  - Mostrar la convergencia al valor de pi, el cual es fuertemente dependiente a cuanto mayor sea el número de lanzamientos en la simulación.
  - Estudiar los métodos de generación de números pseudo aleatorios, y demostrar la convergencia del valor pi simulado al cambiar parámetros como el seed (semilla de generación de números aleatorios), o las distribuciones probabilisticas en la generación aleatorea en los lanzamientos. 


## MC SIMPLE
La carpeta MC SIMPLE contiene archivos que hacen el análisis simple y de relación de áreas.

Contiene los siguientes scripts:
- analisismc.py  Obtiene gráficas sobre como una distribución uniforme para generar las posiciones de cada lanzamiento, generan una salida con un comportamiento normal.
- comparacion.py Obtiene gráficas comparativas sobre el uso de distintas distribuciones randomicas.
- distribucion_uniforme.py Obtiene una gráfica comparativa de los errores vs Número de lanzamientos, con distintas semillas (seeds) de generación de números pseudoaleatorios usando el algoritmo Mersenne Twister (MT19937)
- errors.py Contiene dos funciones, una que genera gráficas de como evoluciona el Error vs Número de lanzamientos. Tanto en escala lineal como logarítmica para comparar. La otra función devuelve el vector error lineal y log.
- montepi.py Contiene dos funciones, una que realiza el cálculo de Pi dado un número N, y una función que repite m veces el experimento para realizar estadísticas.

## MC laplace

- piLaplace.py y piLaplaceBuffon.py calculan el valor de Pi mediante cada método MC.
- statsBuff.py una función que repite m veces el experimento para realizar estadísticas.
- imagenerator.py Contiene funciones que generan las imagenes respuesta para cada N,m y una gráfica del comportamiento de los errores vs número de lanzamientos.
- erroresLaplace.py genera unas gráficas del error y discrepancia.
- auto.py para automatizar la generación de los gráficos y simulaciones.


### Development

Want to contribute? Great!
-Fork, change your best and pull request!


