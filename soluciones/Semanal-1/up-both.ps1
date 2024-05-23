kubectl delete namespace laravel
kubectl delete namespace phpmyadmin

kubectl apply -f php/namespace.yaml
kubectl apply -f laravel/namespace.yaml

kubectl apply -f ./php/ --recursive
kubectl apply -f ./laravel/ --recursive

Read-Host -Prompt "Press any key to continue"