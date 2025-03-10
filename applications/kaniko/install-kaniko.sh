# echo "/opt/repos/gitops-infra/applications/kaniko/docker -alldirs -mapall="$(id -u)":"$(id -g)" $(minikube ip -p minik-nodes)" | sudo tee -a /etc/exports
# minikube stop -p minik-nodes
# minikube ssh -p minik-nodes
# minikube start --driver qemu --network socket_vmnet -p minik-nodes mount "/opt/repos/gitops-infra/applications/kaniko/docker:/data/dockerfiles"

#minikube addons enable storage-provisioner-rancher -p minik-nodes

# SCP -- Transfer-files
scp -r -i $(minikube ssh-key -p minik-nodes -n minik-nodes-m02) /opt/repos/gitops-infra/applications/kaniko/docker/ubuntu docker@$(minikube ip -p minik-nodes -n minik-nodes-m02):dockerfiles
minikube ssh -p minik-nodes -n  minik-nodes-m02 sudo  mv dockerfiles /data

cd /opt/repos/gitops-infra/applications/kaniko/

kubectl apply -f ns-kaniko.yaml
kubectl apply -f pv-dockerfile.yaml
kubectl apply -f pvc-dockerfile.yaml
kubectl apply -f pod-kaniko.yaml

minikube ssh -p minik-nodes -n minik-nodes-m02

# kubectl replace --grace-period 0 --force -f pod-kaniko.yaml

# UNINSTALL
kd delete ns kaniko  
kd delete pv dockerfile 


# Publish a package in github
export CR_PAT=YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
docker push ghcr.io/alejandropriv/nginx:1.28.3


