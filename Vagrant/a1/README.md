# Vagrant con VirtualBox
##  Comprobación Rubrica.

### (3.3) Comprbar proyecto 1

Dentro de la carpeta del proyecto abrimos un terminal y lanzamos la maquina con **vagrant up**.
![ComprobacionProyecto1](./img/3.3-01.png)

Luego de que la máquina arranque usamos **vagrant ssh**.
![ComprobacionProyecto1](./img/3.3-02.png)

### (5.2) Comprobar proyecto 2

Comprobaremos que el puerto 4567 está a la escucha con **Vagrant port**.
![ComprobacionProyecto2](./img/5.2-01.png)

Abrimos el navegador web y pondemos la  url **http://127.0.0.1:4567**.
![ComprobacionProyecto2](./img/5.2-02.png)


### (6.1) Suministro Shell Script
Crear directorio, entramos, creamos fichero html/index.html
![SuministroShell](./img/6.1-01.png)

![SuministroShell](./img/6.1-02.png)

Crear el scrip y darles permisos de ejecución.
![SuministroShell](./img/6.1-03.png)

![SuministroShell](./img/6.1-04.png)

Crear el ficehro vagrantfile.
![SuministroShell](./img/6.1-05.png)

Lanzamos la maquina.
![SuministroShell](./img/6.1-06.png)

Y comprobamos accediendo a la url para ver si se ha instalado el apache.
![SuministroShell](./img/5.2-02.png)


### (6.2) Suministro Puppet
Creamos la carpeta del directorio, vagrantfile y el fichero install_puppet.sh

![SuministroPuppet](./img/6.2-01.png)

![SuministroPuppet](./img/6.2-02.png)

![SuministroPuppet](./img/6.2-03.png)

Creamos un fichero manifests y dentro un archivo default.pp con las siguientes lineas.
![SuministroPuppet](./img/6.2-04.png)

Con esto lanzamos la maquina.
![SuministroPuppet](./img/6.2-05.png)

Y lanzamos vagrant provision instalar el programa usando puppet.
![SuministroPuppet](./img/6.2-06.png)


### (7.2) Crear Box Vagrant
Priemro creamos la carpeta para trabajar y entramos en ella.
![SuministroPuppet](./img/7.2-01.png)

Con **VBoxManage list vms** vemos las maquinas virtuales que tenemos, seleccionamos la que vamos a convertir en una caja de vagrant y copiamos el nombre.
![SuministroPuppet](./img/7.2-02.png)

Lanzamos el siguiente comando que nos creara el package.box de la maquina vidtual.
![SuministroPuppet](./img/7.2-03.png)

Ahora lanzamos **vagrant box list** para ver las cajas que tenemos y veremos que no esta la nuestra porque debemos añadirla, para ello usamos **vagrant box add micaja12-ubuntu.client package.box**
![SuministroPuppet](./img/7.2-04.png)

