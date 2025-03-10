Apply helm configure to traefik: 


    cd applications/traefik 
    
    scp traefik-config.yaml alejandropriv@192.168.0.10:/tmp/traefik-config.yaml
    
    ssh alejandropriv@192.168.0.10
    
    sudo cp /tmp/traefik-config.yaml /var/lib/rancher/k3s/server/manifests/

    sudo systemctl restart k3s

Patch the loadbalancer:

    kubectl patch service traefik -n kube-system --patch "$(cat traefik-service-patch.yaml)"
    


Reinstall parts of the k3s

    k delete job -n kube-system helm-install-traefik

    k delete job -n kube-system helm-install-traefik-crd

Check traefik service:

    kubectl get svc traefik -n kube-system


check traefik logs: 
    kubectl logs -n kube-system -l app.kubernetes.io/name=traefik  


Check if the ports are open

    nc -vz 192.168.0.10 80
    netstat -tuln | grep 8085


    kubectl apply -k /Users/alejandroprieto/projects/gitops-infra/environments/development



