# El método de MONTE CARLO 

En este estudio se pretende mostrar una aproximación del uso del método
monte carlo para aproximar el valor de Pi por dos métodos:
- Relación de áreas de circunferencia y cuadrado.
- Aplicando el método de Laplace
- 
# ¿Qué resultados se pretenden obtener?

  - Mostrar la convergencia al valor de pi, el cual es fuertemente dependiente a cuanto mayor sea el número de lanzamientos en la simulación.
  - Estudiar los métodos de generación de números pseudo aleatorios, y demostrar la convergencia del valor pi simulado al cambiar parámetros como el seed (semilla de generación de números aleatorios), o las distribuciones probabilisticas en la generación aleatorea en los lanzamientos. 
  - Obtener métricas de costo computacional al implementar distintos métodos, particularmente comparar el rendimiento en el uso de la librera numpy y los métodos tradicionales en python. 




Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.  As [John Gruber] writes on the [Markdown site][df1]

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.


### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md][PlDb] |
| GitHub | [plugins/github/README.md][PlGh] |
| Google Drive | [plugins/googledrive/README.md][PlGd] |
| OneDrive | [plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

