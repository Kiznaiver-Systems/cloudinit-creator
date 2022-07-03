### Info ###
# This is a Proxmox Cloudinit creator

### Image Links ###
## Debian ##
debian10image='https://cloud.debian.org/images/cloud/buster/latest/debian-10-genericcloud-amd64.qcow2'
debian10filename='debian-10-genericcloud-amd64.qcow2'
debian11image='https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2'
debian11filename='debian-11-genericcloud-amd64.qcow2'
## Ubuntu ##
ubuntu2004image='https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img'
ubuntu2004filename='focal-server-cloudimg-amd64.img'
ubuntu2110image='https://cloud-images.ubuntu.com/impish/current/impish-server-cloudimg-amd64.img'
ubuntu2110filename='impish-server-cloudimg-amd64.img'
ubuntu2204image='https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img'
ubuntu2204filename='jammy-server-cloudimg-amd64.img'

### Variables ###
## colors ##
defaultcolor='\033[0m'
cyan='\033[0;96m'

### Welcome ###
echo -e "*****************************"
echo -e "* Proxmox Cloudinit Creator *"
echo -e "*   by Kiznaiver.Systems    *"
echo -e "*           v1.0.0          *"
echo -e "*****************************"

### Script ###
## Debian 10 ##
cloudinit_debian10(){
    echo -e "${cyan}You have selected Debian 10${defaultcolor}"
    echo -e "${cyan}Download Debian 10:${defaultcolor}"
    wget ${debian10image} -q --show-progress
    virt-customize -a ${debian10filename} --install qemu-guest-agent
    echo -e "${cyan}What ID should the Cloudinit image have e.g. 9000?${defaultcolor}"
    read -p "> " imageid
    echo -e "${cyan}What name should the Cloudinit image have?${defaultcolor}"
    read -p "> " imagename
    qm create ${imageid} --name "${imagename}" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
    echo -e "${cyan}What is the name of the disk (mostly local)${defaultcolor}"
    read -p "> " diskname
    qm importdisk ${imageid} ${debian10filename} ${diskname} --format qcow2
    qm set ${imageid} --scsihw virtio-scsi-pci --scsi0 /dev/pve/vm-${imageid}-disk-0
    qm set ${imageid} --boot c --bootdisk scsi0
    qm set ${imageid} --ide2 ${diskname}:cloudinit
    qm set ${imageid} --serial0 socket --vga serial0
    qm set ${imageid} --agent enabled=1
    qm template ${imageid}
    rm ${debian10filename}
}
## Debian 11 ## 
cloudinit_debian11(){
    echo -e "${cyan}You have selected Debian 11${defaultcolor}"
    wget ${debian11image} -q --show-progress
    virt-customize -a ${debian11filename} --install qemu-guest-agent
    echo -e "${cyan}What ID should the Cloudinit image have e.g. 9000?${defaultcolor}"
    read -p "> " imageid
    echo -e "${cyan}What name should the Cloudinit image have?${defaultcolor}"
    read -p "> " imagename
    qm create ${imageid} --name "${imagename}" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
    echo -e "${cyan}What is the name of the disk (mostly local)${defaultcolor}"
    read -p "> " diskname
    qm importdisk ${imageid} ${debian11filename} ${diskname} --format qcow2
    qm set ${imageid} --scsihw virtio-scsi-pci --scsi0 /dev/pve/vm-${imageid}-disk-0
    qm set ${imageid} --boot c --bootdisk scsi0
    qm set ${imageid} --ide2 ${diskname}:cloudinit
    qm set ${imageid} --serial0 socket --vga serial0
    qm set ${imageid} --agent enabled=1
    qm template ${imageid}
    rm ${debian11filename}
}
## Ubuntu 20.04 ##
cloudinit_ubuntu2004(){
    echo -e "${cyan}You have selected Ubuntu 20.04${defaultcolor}"
    wget ${ubuntu2004image} -q --show-progress
    virt-customize -a ${ubuntu2004filename} --install qemu-guest-agent
    echo -e "${cyan}What ID should the Cloudinit image have e.g. 9000?${defaultcolor}"
    read -p "> " imageid
    echo -e "${cyan}What name should the Cloudinit image have?${defaultcolor}"
    read -p "> " imagename
    qm create ${imageid} --name "${imagename}" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
    echo -e "${cyan}What is the name of the disk (mostly local)${defaultcolor}"
    read -p "> " diskname
    qm importdisk ${imageid} ${ubuntu2004filename} ${diskname} --format qcow2
    qm set ${imageid} --scsihw virtio-scsi-pci --scsi0 /dev/pve/vm-${imageid}-disk-0
    qm set ${imageid} --boot c --bootdisk scsi0
    qm set ${imageid} --ide2 ${diskname}:cloudinit
    qm set ${imageid} --serial0 socket --vga serial0
    qm set ${imageid} --agent enabled=1
    qm template ${imageid}
    rm ${ubuntu2004filename}
}
## Ubuntu 21.10 ##
cloudinit_ubuntu2110(){
    echo -e "${cyan}You have selected Ubuntu 21.10${defaultcolor}"
    wget ${ubuntu2110image} -q --show-progress
    virt-customize -a ${ubuntu2110filename} --install qemu-guest-agent
    echo -e "${cyan}What ID should the Cloudinit image have e.g. 9000?${defaultcolor}"
    read -p "> " imageid
    echo -e "${cyan}What name should the Cloudinit image have?${defaultcolor}"
    read -p "> " imagename
    qm create ${imageid} --name "${imagename}" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
    echo -e "${cyan}What is the name of the disk (mostly local)${defaultcolor}"
    read -p "> " diskname
    qm importdisk ${imageid} ${ubuntu2110filename} ${diskname} --format qcow2
    qm set ${imageid} --scsihw virtio-scsi-pci --scsi0 /dev/pve/vm-${imageid}-disk-0
    qm set ${imageid} --boot c --bootdisk scsi0
    qm set ${imageid} --ide2 ${diskname}:cloudinit
    qm set ${imageid} --serial0 socket --vga serial0
    qm set ${imageid} --agent enabled=1
    qm template ${imageid}
    rm ${ubuntu2110filename}
}
## Ubuntu 22.04 ##
cloudinit_ubuntu2204(){
    echo -e "${cyan}You have selected Ubuntu 22.04${defaultcolor}"
    wget ${ubuntu2204image} -q --show-progress
    virt-customize -a ${ubuntu2204filename} --install qemu-guest-agent
    echo -e "${cyan}What ID should the Cloudinit image have e.g. 9000?${defaultcolor}"
    read -p "> " imageid
    echo -e "${cyan}What name should the Cloudinit image have?${defaultcolor}"
    read -p "> " imagename
    qm create ${imageid} --name "${imagename}" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
    echo -e "${cyan}What is the name of the disk (mostly local)${defaultcolor}"
    read -p "> " diskname
    qm importdisk ${imageid} ${ubuntu2204filename} ${diskname} --format qcow2
    qm set ${imageid} --scsihw virtio-scsi-pci --scsi0 /dev/pve/vm-${imageid}-disk-0
    qm set ${imageid} --boot c --bootdisk scsi0
    qm set ${imageid} --ide2 ${diskname}:cloudinit
    qm set ${imageid} --serial0 socket --vga serial0
    qm set ${imageid} --agent enabled=1
    qm template ${imageid}
    rm ${ubuntu2204filename}
}
### essential ###
essential(){
    echo -e "${cyan}Install the essential${defaultcolor}"
    apt install libguestfs-tools -y
}
### Select ###
while true; do
    echo "What do you want to do
    1. Install all essentials
    2. Create Debian 10 Cloudinit Image
    3. Create Debian 11 Cloudinit Image
    4. Create Ubuntu 20.04 Cloudinit Image
    5. Create Ubuntu 21.10 Cloudinit Image
    6. Create Ubuntu 22.04 Cloudinit Image
    7. Get help"
    read -p "> " yn
    case $yn in
        [1]* ) essential;;
        [2]* ) cloudinit_debian10; exit;;
        [3]* ) cloudinit_debian11; exit;;
        [4]* ) cloudinit_ubuntu2004; exit;;
        [5]* ) cloudinit_ubuntu2110; exit;;
        [6]* ) cloudinit_ubuntu2204; exit;;
        [7]* ) help;;
        * ) echo "Please answer  1, 2, 3, 4, 5, 6 or 7.";;
    esac
done
