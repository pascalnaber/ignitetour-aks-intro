az group create --name cloudcamp2 --location eastus

# VM's: https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes-general
az aks create --resource-group cloudcamp2 --name aksdemo2 --kubernetes-version 1.11.3 --node-count 3 --node-vm-size "Standard_DS2_v2" --enable-addons http_application_routing --ssh-key-value "/mnt/c/repos/pascal/subscription/ssh/public.pub" --service-principal xxxxx --client-secret xxxxx

kubectl config delete-context aksdemo
az aks get-credentials --resource-group aksdemos --name k8s

kubectl config get-contexts
kubectl config use-context aksdemo

kubectl create clusterrolebinding kubernetes-dashboard -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard






