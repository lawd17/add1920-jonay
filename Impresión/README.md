# Servidor de impresión en Windows.
##  Comprobación Rubrica.

* (1.3) Comprobar que se imprime de forma local.

Primero creamos el documento y seleccionamos imprimir.

![ComprobacionWindows](./img/Impresion19.png)

Entremos en el PDFCreator.

![ComprobacionWindows](./img/Impresion20.png)

Comprobamos que nos lo muestra.

![ComprobacionWindows](./img/Impresion21.png)

Vemos que se a guardado en la ruta por defecto.

![ComprobacionWindows](./img/Impresion22.png)


* (2.2) Comprobar que se imprime de forma remota.

Primero buscamos el recurso de red del servidor.

![ComprobacionWindows](./img/Impresion26.png)

Botón derecho, conectar y ponemos el usuario/clave del Windwos Server.

![ComprobacionWindows](./img/Impresion27.png)

Creamos el documento y le damos a imprimir.

![ComprobacionWindows](./img/Impresion28.png)

Vemos que se ha añadido a cola y luego se va a imprimir.

![ComprobacionWindows](./img/Impresion29.png)

Vamos a ver si se a guardado en la carpeta por defecto.

![ComprobacionWindows](./img/Impresion30.png)


* (3.3) Comprobar que se imprime desde el navegador.

Primero vamos a poner en pausa los trabajos de impresión de la impresora.

![ComprobacionWindows](./img/Impresion34.png)

Vamos al cliente y añadimos el nuevo documento a imprimir. Vemos que se mantiene en cola pero no se imprime.

![ComprobacionWindows](./img/Impresion35.png)

Con esto vamos de nuevo al navegador y quitamos la pausa de impresión.

![ComprobacionWindows](./img/Impresion36.png)

Volvemos al cliente y vemos que comienza la impresión del documento.

![ComprobacionWindows](./img/Impresion37.png)

Comprobamos que se impreso en la carpeta.

![ComprobacionWindows](./img/Impresion38.png)
