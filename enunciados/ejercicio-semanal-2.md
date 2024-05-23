# Ejercicio Semanal 2

## ¡Importante!

Ten mucho cuidado con los valores sensibles que puedas exponer en tus soluciones. Recuerda que otras personas pueden ver la información de tus entregables y, por lo tanto, acceder a este tipo de información. ¡Siempre trata de mantener la seguridad de tus datos y de los datos de tus clientes!


## Enunciado

Vamos a completar el ejercicio de la semana pasada, en este caso incluiremos varios elementos para completar nuestro despliegue.
Todo esto lo empaquetaremos en un chart de Helm.

### Requisitos del despliegue: ###
1. *Todos* los elementos deben desplegarse en un namespace con el nombre `laravel`.
1. Laravel:
    - Se usará la imagen de  bitnami/laravel
    - Laravel tiene que tener tanto limites como requests de CPU y GPU
    - Laravel tiene que tener un readinessProbe y un livenessProbe
    - Volumen persistente para Laravel
    - Ingress para acceder a Laravel  desde un navegador
    

1. BBDD:
    - Se usará la imagen **``oficial``** de la BBDD `mysql` en la versión mysql
    - La BBDD tiene que tener tanto limites como requests de CPU y GPU
    - Volumen  persistentes para la BBDD
    - No debe ser un deployment (¿Qué objeto sería el adecuado?)

1. phpmyadmin:
    - Se usará la imagen **``oficial``** de `phpmyadmin`
    - Ingress para acceder a phpmyadmin desde un navegador
    - phpmyadmin debe solicitar autenticación para acceder
    

### Requisitos del chart: ###

1. Todas las configuraciones de los elementos deben estar en el `values.yaml` del chart:
    - namespace
    - versiones de las imágenes
    - Configuraciones de Laravel
    - Configuraciones de la BBDD
    - Elección de si se despliega o no phpmyadmin
    - Configuraciones de phpmyadmin, en caso de que se despliegue
    - Recursos de CPU y GPU (limites y requests)
    - Capacidad de los volumenes persistentes
    - Configuraciones de los ingress (hosts, paths, etc)
    - Las contraseñas en el `values.yaml` no deben estar codificadas
    - Las opciones que no deben ser modificadas no deben estar en el `values.yaml`


1. Se debe crear dos `values` de ejemplo con un lanzamiento de Laravel (solo laravel y BBDD) y otro con un lanzamiento de Laravel (laravel y BBDD) y phpmyadmin.


1. Se debe crear un `README.md` con la información necesaria para desplegar el chart.


### Opcional ###

1. Incluiremos un `cronjob` que se encargue de hacer un backup de la BBDD de Laravel cada 24 horas.
    - El backup se guardará en un volumen persistente
    - Se debe poder configurar la hora de ejecución del `cronjob` desde el `values.yaml`


## Nota

¡ No olvides leer **dos** veces !
