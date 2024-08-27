#!bin/sh

username=bapasqui

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root. (Using this command : su - or sudo the file)"
  exit 1
fi

## INSTALL YAY
install_yay()
{
    echo "Installing yay"
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

docker_setup()
{
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
    ## install PORTAINER
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.0
}

setup_smb()
{
    echo "Setup Samba"
    ## SETUP SAMBA share
    mkdir inception
    cp /etc/samba/smb.conf.default /etc/samba/smb.conf
    sudo systemctl enabled smbd.socket
    sudo systemctl start smbd.socket
    useradd $username
    echo -e $password"\n"$password | smbpasswd -s $username
}

## UPDATE
echo "Updating system"
if [ -f /etc/arch-release ]; then
    pacman -Syu
    pacman -S ssh samba git
    install_yay
    docker_setup
    setup_smb
else if [ -f /etc/debian_version ]; then
    apt-get update
    apt-get upgrade
    apt-get install ssh samba git
    docker_setup
    setup_smb
else
    echo "Unsupported OS"
    exit 1
fi

git clone https://github.com/Haletran/42_Inception 
