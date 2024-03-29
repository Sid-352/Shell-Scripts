sudo apt update
sudo apt upgrade -y
sudo apt-get install net-tools
sudo apt install openssh-server -y

wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar -xvf ngrok-stable-linux-amd64.tgz
sudo mv ngrok /usr/local/bin
rm ngrok-stable-linux-amd64.tgz
ngrok [id-here]

sudo nmcli device wifi connect "Jio" password "12345678"
sudo nmcli con mod "Jio" ipv4.method manual
sudo nmcli con mod "Jio" ipv4.addresses 192.168.29.10/24
sudo nmcli con up "Jio"
sudo systemctl restart NetworkManager

sudo apt-get install samba -y
mkdir ~/Shares
chmod 777 ~/Shares
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

echo "[Shares]" | sudo tee -a /etc/samba/smb.conf
echo "   path = ~/Shares" | sudo tee -a /etc/samba/smb.conf
echo "   browseable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
echo "   create mask = 0666" | sudo tee -a /etc/samba/smb.conf
echo "   directory mask = 0777" | sudo tee -a /etc/samba/smb.conf

sudo ufw allow Samba
sudo ufw reload
sudo service smbd restart
sudo smbpasswd -a smb-user
sudo service smbd restart

echo "Done."
