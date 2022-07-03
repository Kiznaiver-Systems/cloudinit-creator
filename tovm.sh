### Info ###
# This is a Proxmox VM creator from a Cloudinit imge

### Variables ###
## colors ##
defaultcolor='\033[0m'
cyan='\033[0;96m'

### Welcome ###
echo -e "*****************************"
echo -e "*    Proxmox VM Creator     *"
echo -e "*   by Kiznaiver.Systems    *"
echo -e "*           v1.0.0          *"
echo -e "*****************************"

### Script ###
echo -e "${cyan}Which cloudinit image to use (id)${defaultcolor}"
read -p "> " cloudid
echo -e "${cyan}What id should the new VM have${defaultcolor}"
read -p "> " vmid
echo -e "${cyan}What name should the new VM have${defaultcolor}"
read -p "> " vmname
echo -e "${cyan}Which ip should the new VM have${defaultcolor}"
read -p "> " vmip
echo -e "${cyan}How is the gateway to the ip${defaultcolor}"
read -p "> " vmgw
echo -e "${cyan}how much ram should the VM have in mb${defaultcolor}"
read -p "> " vmmem
echo -e "${cyan}how big should the hard disk be in gb${defaultcolor}"
read -p "> " vmdi
echo -e "${cyan}how many cores should the VM have${defaultcolor}"
read -p "> " vmco
echo -e "${cyan}What should the root password be${defaultcolor}"
read -p "> " vmrpw
qm clone ${cloudid} ${vmid} --name ${vmname}
qm set ${vmid} --ipconfig0 ip=${vmip},gw=${vmgw} --ciuser root --cipassword ${vmrpw} --sshkey ~/.ssh/id_rsa.pub --memory ${vmmem} --cores ${vmco}
qm resize ${vmid} scsi0 +${vmdi}G
if [ -d /srv/VMLogins/ ];
  then
    cd /srv/VMLogins/
  else
    mkdir /srv/VMLogins
fi
exec 3<> /srv/VMLogins/login_${vmid}.txt
    echo "### Login data for ${vmid} ###
    VM IP: ${vmip}
    VM PW: ${vmrpw}" >&3
exec 3>&-
echo -e "${cyan}You can check your login data again under /srv/VMLogins/login_${vmid}.txt${defaultcolor}"
