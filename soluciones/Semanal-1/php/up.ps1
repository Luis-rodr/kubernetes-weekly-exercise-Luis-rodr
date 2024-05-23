# Delete previous

kubectl delete namespace phpmyadmin

kubectl apply -f namespace.yaml

kubectl apply -f ./ --recursive

kubectl get all -n phpmyadmin

Read-Host -Prompt "Press any key to continue"

kubectl port-forward svc/phpmyadmin-service 8081:80 -n phpmyadmin