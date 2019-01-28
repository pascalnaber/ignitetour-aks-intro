


https://stackoverflow.com/questions/48556971/unable-to-install-kubernetes-charts-on-specified-namespace

# Option 1: Custom role with access to *
# Create ServiceAccount, ClusterRole and ClusterRoleBinding 
kubectl apply -f 1.yaml
kubectl edit deployment -n kube-system tiller-deploy

serviceAccountName: tiller-serviceaccount

# Option 2: ServiceAccount becomes cluster-admin
# If Helm is already installed:
kubectl -n kube-system delete deployment tiller-deploy
# Create ServiceAccount and ClusterRoleBinding
kubectl apply -f ./Demos/0prepare/1helm/2.yaml

# install helm (latest version: https://github.com/helm/helm/releases/latest)                        
curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-linux-amd64.tar.gz
tar -xvf /tmp/helm-linux-amd64.tar.gz -C /tmp/
chmod +x  /tmp/linux-amd64/helm && sudo mv /tmp/linux-amd64/helm /usr/local/bin/

https://docs.helm.sh/using_helm/#securing-your-helm-installation

# install helm locally & on the k8s cluster (tiller)
helm init --service-account tiller --upgrade

# latest charts
helm repo update




helm install --set wordpressUsername=admin,wordpressPassword=Pa$$w0rd,serviceType=ClusterIP,ingress.enabled=true,ingress.hosts[0].name=pnaber.a5c2cca35cc64b0ca564.eastus.aksapp.io,ingress.hosts[0].annotations."kubernetes\.io/ingress\.class"=addon-http-application-routing stable/wordpress
helm install -f ./values.yaml stable/wordpress

helm upgrade nihilist-quokka stable/wordpress --set wordpressUsername=admin,wordpressPassword=Pa$$w0rd,serviceType=ClusterIP,ingress.enabled=true,ingress.hosts[0].name=pnaber.a5c2cca35cc64b0ca564.eastus.aksapp.io,ingress.hosts[0].annotations[kubernetes.io/ingress.class]=addon-http-application-routing
helm upgrade loitering-molly -f ./assignments/8helm/values.yaml stable/wordpress 
helm ls