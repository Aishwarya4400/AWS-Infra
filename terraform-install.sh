sudo apt update -y
sudo apt install wget unzip -y
wget https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip
unzip terraform_1.0.7_linux_amd64.zip
sudo mv terraform /usr/local/bin
sudo apt-get install python3-pip -y
sudo pip3 install awscli
