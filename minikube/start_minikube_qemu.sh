# minikube start --driver qemu --network socket_vmnet --nodes=2 -p minik-nodes --memory='4g' --cpus='2' --disk-size='50g'

# minikube start --driver qemu --network socket_vmnet -p minik-nodes --mount --mount-string="/opt/repos/stock-cluster/applications/kaniko/docker:/mnt/vdb1/hostpath_pv"

minikube start --driver qemu --network socket_vmnet -p minik-nodes
