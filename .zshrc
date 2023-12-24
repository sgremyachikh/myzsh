# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#"robbyrussell" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-kubectl-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# kubectl
source <(kubectl completion zsh)
# helm
source <(helm completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Only load Liquid Prompt in interactive shells, not from a script or from scp
#[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# export PY_USER_BIN=$(python -c 'import site; print(site.USER_BASE + "/bin")')
# export PATH=$PY_USER_BIN:$PATH

# disable mouse middle buton paste
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# git aliases
alias gadd="git add ."

# do not delete
chmod 600 $HOME/.kube/config


# E_GKE_GCLOUD_AUTH_PLUGIN=True
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

alias k9s="~/.local/bin/k9s"

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

# Ansible ENV VARS
###export JIRA_USER=''
###export JIRA_PASSWORD=''
###export SQL_DEPLOY_PASSWORD=''
###export SA_USERNAME=''
###export SA_PASSWORD=''
###export PG_REPLICATION_USER=''
###export PG_REPLICATION_PASSWORD=''
###export PG_REWIND_USER=''
###export PG_REWIND_PASSWORD=''
export WINDOWS_USER=$WINDOWS_DOMAIN_USER
export WINDOWS_PASSWORD=$WINDOWS_DOMAIN_PASSWORD
###export WINDOWS_GCE_USER=''
###export WINDOWS_GCE_PASSWORD=''
###export ZABBIX_USER=''
###export ZABBIX_PASSWORD=''
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

