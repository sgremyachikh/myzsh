# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git fzf-zsh-plugin zsh-autosuggestions zsh-syntax-highlighting zsh-kubectl-prompt)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi


# kubectl
source <(kubectl completion zsh)
# helm
source <(helm completion zsh)

# disable mouse middle buton paste
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# git aliases
alias gadd="git add ."

# do not delete
chmod 600 $HOME/.kube/config


# kubectl aliases
alias kubectl=kubecolor
# make completion work with kubecolor
compdef kubecolor=kubectl
alias k="kubectl"
alias kgc="kubectl config get-contexts"
alias kcc="kubectl config current-context"
alias kuc="kubectl config use-context"
alias kgp="kubectl get pods"
alias kgd="kubectl get deployment"
alias kns="kubectl config current-context | xargs -I {} kubectl config set-context {}"

# terraform
alias tf="terraform"

# ================= secrets ===============
# vpn password
export vpn_password=''


# --- ipa account
export ipa_user=''
export ipa_password=''

# --- domain account (short name) with admin rights
export WINDOWS_DOMAIN_USER=''
export WINDOWS_DOMAIN_PASSWORD=''

# --- vmware user
export VMWARE_USER=$WINDOWS_DOMAIN_USER
export VMWARE_PASSWORD=$WINDOWS_DOMAIN_PASSWORD

# --- linux root password
export linux_root_password=''

# --- A10 LB Creds
export A10_USER=''
export A10_PASSWORD=''

#CF
export CLOUDFLARE_API_TOKEN=''
export TF_VAR_cf_api_token=$CLOUDFLARE_API_TOKEN

# tf vars:
export TF_VAR_vsphere_username=$VMWARE_USER
export TF_VAR_vsphere_password=$VMWARE_PASSWORD
export TF_VAR_vm_password=$WINDOWS_DOMAIN_PASSWORD
export TF_VAR_linux_root_password=$linux_root_password
export TF_VAR_vm_user=$WINDOWS_DOMAIN_USER
export TF_VAR_active_directory_password=$WINDOWS_DOMAIN_PASSWORD
export TF_VAR_windows_admin_password=$WINDOWS_DOMAIN_PASSWORD
export TF_VAR_freeipa_username=$ipa_user
export TF_VAR_freeipa_password=$ipa_password

# --- vSphere credentials for vSphere Cloud Provider integration user
export TF_VAR_k8s_vsphere_password=''

# --- Password for Flux CD Bitbucket bot user
export TF_VAR_flux_bot_password=''


export WINDOWS_USER=$WINDOWS_DOMAIN_USER
export WINDOWS_PASSWORD=$WINDOWS_DOMAIN_PASSWORD
export VM_PRIVILEGE_PASSWORD=$WINDOWS_DOMAIN_PASSWORD

# ----- Vault credentials
export ANSIBLE_HASHI_VAULT_USERNAME=$WINDOWS_DOMAIN_USER
export ANSIBLE_HASHI_VAULT_PASSWORD=$WINDOWS_DOMAIN_PASSWORD

# govc envs for VMWARE
export GOVC_URL=https://127.0.0.1/sdk
export GOVC_USERNAME=$VMWARE_USER
export GOVC_PASSWORD=$VMWARE_PASSWORD
export GOVC_INSECURE='true'

# zsh-kubectl-prompt
# https://github.com/superbrothers/zsh-kubectl-prompt
autoload -U colors; colors
source ~/.oh-my-zsh/custom/plugins/zsh-kubectl-prompt/kubectl.zsh
function right_prompt() {
  local color="yellow"
  if [[ -z "$(echo $ZSH_KUBECTL_USER | grep gke_)" ]]; then
    color=green
  fi
  if [[ "$ZSH_KUBECTL_USER" =~ "admin" ]]; then
    color=red
  fi
  echo "%{$fg[$color]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}"
}
RPROMPT='$(right_prompt)'

# https://stackoverflow.com/questions/40076573/adding-timestamp-to-each-line-on-zsh
PROMPT='%{$fg[yellow]%}[%*] '$PROMPT

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

pw() { LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c $1 ; echo '' }
