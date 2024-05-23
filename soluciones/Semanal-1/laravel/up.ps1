# Delete previous

kubectl delete namespace laravel

kubectl apply -f namespace.yaml

kubectl apply -f ./ --recursive

kubectl get all -n laravel

Read-Host -Prompt "Press any key to continue"

kubectl port-forward svc/laravel-service 8000:8000 -n laravel