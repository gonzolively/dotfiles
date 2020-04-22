# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Ensure snap is in path
export PATH=$PATH:/snap/bin

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Get antigen up and running
source $HOME/.oh-my-zsh/plugins/antigen/antigen.zsh

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

######################
### Antigen Config ###
######################

# Bundles from the default repo (oh-my-zsh)
antigen bundle git
antigen bundle pip
antigen bundle colored-man-pages

# Community bundles
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle fcambus/ansiweather

# load theme (local)
#antigen theme robbyrussell
#antigen theme jnrowe
antigen theme gnzh
#antigen theme pygmalion
#antigen theme agnoster

# load theme (community)
#antigen theme romkatv/powerlevel10k powerlevel10k

# Tell Antigen that you're done.
antigen apply

source $ZSH/oh-my-zsh.sh
#########################
##### CUSTOM STUFFS #####
#########################

SAVEHIST=10000
HISTSIZE=5000
HISTFILESIZE=10000

# Custom Alias'
alias vi=vim
alias edit=vim
alias weather=ansiweather
alias newbox='vagrant destroy -f && clear && vagrant up'
alias lynx="lynx --accept-all-cookies www.google.com"

# Fix globbing issues
setopt +o nomatch

#########################
####### Functions #######
#########################

# Function to get currently install nvidia drivers, as well as availble drivers
get_nvidiadrivers () {
sudo apt-get update > /dev/null &&
current_driver=$(nvidia-smi | grep 'Driver Version:' | cut -d ":" -f2 | cut -d ' ' -f 2 | cut -d '.' -f 1)
available_drivers=$(ubuntu-drivers devices | grep nvidia-driver | cut -d ":" -f2 | cut -d " " -f2 | sort -r)
echo -e "\n\e[92mDriver Version:\e[0m $current_driver"
echo -e "\n\e[31mAvailable Drivers:\e\e[0m\n$available_drivers\n"
}

# Echos all 256 colors to terminal
color_test () {
echo -n "\n"
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
echo -n "\n"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias for my git bare repo dotfile stuff
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
