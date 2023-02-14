# kubernetes-setup
kubernetes setup


## Packer
Packer is used to create a server template in proxmox. It will contain all the necessary services and binaries for creating and managing a kubernetes cluster.

## Terraform
Terraform creates the kubernetes controler and nodes from the template created by packer.

## Ansible
Ansible has a series of folders that will configure different services inside the kubernetes cluster.

### Initial setup
This ansible playbook will connect to the controler and initiate it. Afterwards, it will copy the join command, connect to the nodes and join them to the controler.

### Tools
Install some useful tools. For now, it will only install k9s for easy cli visualization of the cluster.

### Storage
This playbook installs and configures nfs-subdir-external-provisioner as a storage provisioner

### Load balancer
Bare metal clusters need a load balancer running somewhere. This playbook installs metallb

NOTE: This is not a well behaved playbook yet. Installing the metallb manifest will take some time, and the playbook will try to configure the address pool and layer 2 advertisement.

### Sealed secrets
Installs the bitnami sealed secrets tool, and associated controller.

in the controller, run:
```bash
kubeseal < secret.yaml
```

copy the resulting output to `secret.json`

### Ingress
Installs and configures traefik.

### Cert manager
Installs and configures cert manager to use cloudflare, and adds a letsencrypt issuer.

### Portainer
Installs portainer in its own namespace. It creates a certificate just for portainer, and then configures the helm chart ingress to use it.

NOTE: This is not a well behaved playbook yet. the certificate generation takes some time, and the playbook will just try to install the portainer helm chart as soon as it starts the previous process.

### Home
This playbook creates a "home-services" namespace, where all the services will live. It aditionally creates a wildcard certificate that all services can use for their ingress configuration

### Transmission
Installs transmission from geek-cookbook helm charts repository

### Firefly
Installs firefly-iii from the official firefly-iii helm repository