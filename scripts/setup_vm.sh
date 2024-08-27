#!bin/sh

username=bapasqui2
password=123
pwd=$(pwd)

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root. (Using this command : su - or sudo the file)"
  exit 1
fi

docker_setup()
{
    pacman -S docker docker-compose git --noconfirm
    echo "Setup Docker"
    ## INSTALL DOCKER
    if [ -f /etc/arch-release ]; then
        pacman -S docker docker-compose
    elif [ -f /etc/debian_version ]; then
        apt-get install docker docker-compose
    else
        echo "Unsupported OS"
        exit 1
    fi
    usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
    ## install PORTAINER
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.0
}

#setup_smb()
#{
#    echo "Setup Samba"
#    ## SETUP SAMBA share
#    #mkdir inception
#    cp /etc/samba/smb.conf.default /etc/samba/smb.conf
#    sudo systemctl enable samba
#    sudo systemctl start samba
#    useradd $username
#    echo -e $password"\n"$password | smbpasswd -s $username
#}

## UPDATE
echo "Updating system"
pacman -Syu --noconfirm
docker_setup
setup_smb
#git clone https://github.com/Haletran/42_Inception 
