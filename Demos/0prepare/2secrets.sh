## create secret in k8s to access the acr
kubectl create secret docker-registry clouddemoimages --docker-server=https://clouddemo.azurecr.io --docker-username=clouddemo --docker-password=xxxxxx --docker-email=xxxx

# sql server connection
kubectl apply -f ./Demos/0prepare/secret.yaml