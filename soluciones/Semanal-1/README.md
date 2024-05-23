##  Para levantar los proyectos
1. Este proyecto ha sido desarrollado con kubectl y minikube instalados, aunque no se hace uso de minikube para el despliegue, haciendo unicamente port forward.
1. Asegúrate de que nada ocupa los puertos 8000 y 8081 en tu máquina, pues los port forward usan esos puertos.
1. *__IMPORTANTE__*: Revisa que no tienes nada valioso, o preferentemente nada en específico en los namespaces ``phpmyadmin`` y ``laravel`` de kubernetes, pues primero se va a __BORRAR__ ambos, antes de recrearlos para el despliegue.
1. Ejecuta los archivos ``up.ps1`` presentes en las carpetas 'laravel' y 'php' respectivamente. De forma alternativa, puedes ejecutar los comandos allí presentes.
    
    - Si en lugar de eso quieres ejecutar ambos a la vez, desde la ubicación de este archivo, abre una terminal y ejecuta `up-both.ps1`, que contiene
        ```
        kubectl delete namespace laravel
        kubectl delete namespace phpmyadmin

        kubectl apply -f php/namespace.yaml
        kubectl apply -f laravel/namespace.yaml

        kubectl apply -f ./php/ --recursive
        kubectl apply -f ./laravel/ --recursive

        Read-Host -Prompt "Press any key to continue"
        ```
        Y abre una terminal extra en el mismo lugar, en una terminal ejecuta:

        ``kubectl port-forward svc/laravel-service 8000:8000 -n laravel``

        Y en la otra:
    
        ``kubectl port-forward svc/laravel-service 8000:8000 -n laravel``    