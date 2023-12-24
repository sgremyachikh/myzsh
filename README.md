# Preparation of local env

```shell
sudo yum install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


#  Change local shell with zsh


#  Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#  zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


#  install gcloud CLI and install kubectl
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

sudo dnf install libxcrypt-compat.x86_64 -y

sudo dnf install google-cloud-cli kubectl -y


#  zsh-kubectl-prompt
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/superbrothers/zsh-kubectl-prompt.git


#  install helm
sudo yum install openssl -y
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


# install govc
# extract govc binary to /usr/local/bin
# note: the "tar" command must run with root permissions
sudo curl -L -o - "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" | sudo tar -C /usr/local/bin -xvzf - govc


#  install ansible
pip install ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install containers.podman
ansible-galaxy collection install confluent.platform
ansible-galaxy collection install ansible.windows
ansible-galaxy collection install community.windows
ansible-galaxy collection install chocolatey.chocolatey
ansible-galaxy collection install community.rabbitmq
ansible-galaxy collection install community.general
ansible-galaxy collection install community.postgresql
ansible-galaxy collection install community.kubernetes
ansible-galaxy collection install cloud.common
ansible-galaxy collection install community.hashi_vault
pip install pywinrm
pip install requests-credssp
pip install hvac


#  install terraform



#  replace your ~/.zshrc with current
```
