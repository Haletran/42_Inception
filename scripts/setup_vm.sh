#!bin/sh

username=bapasqui

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root. (Using this command : su - or sudo the file)"
  exit 1
fi

## UPDATE
echo "Updating system"

git clone https://github.com/Haletran/42_Inception /home/$username/inception

## INSTALL YAY
install_yay()
{
    echo "Installing yay"
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

docker_setup()-
{
    echo "Setup Docker"
    ## INSTALL DOCKER
    pacman -S docker docker-compose
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