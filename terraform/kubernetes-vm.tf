resource "proxmox_vm_qemu" "k8s-ctrlr" {
    
    for_each = var.servers

    # VM General Settings
    target_node = each.value.node
    vmid = each.value.vmid
    name = each.value.name
    desc = each.value.description

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-k8s-template"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = each.value.cores
    sockets = each.value.sockets
    cpu = "host"
    
    # VM Memory Settings
    memory = each.value.memory

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
        macaddr = each.value.macaddr
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    ipconfig0 = "ip=dhcp"
}