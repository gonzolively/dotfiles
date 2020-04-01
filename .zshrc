# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
 
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/home/knox/.oh-my-zsh"

# Get antigen up and running
source /home/knox/.oh-my-zsh/plugins/antigen.zsh

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

######################
### Antigen Config ###
######################

# Bundles from the default repo (oh-my-zsh)
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
#antigen theme robbyrussell
#antigen theme jnrowe

antigen theme gnzh
#antigen theme pygmalion
#antigen theme agnoster

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

# Fix globbing issues
setopt +o nomatch


#########################
####### Functions #######
#########################

# Function to get currently install nvidia drivers, as well as availble drivers
get_nvidiadrivers () {
# This function will display the currently installed nvidia driver, and which ones are availble.
current_driver=$(nvidia-smi | grep 'Driver Version:' | cut -d ":" -f2 | cut -d ' ' -f 2 | cut -d '.' -f 1)
available_drivers=$(ubuntu-drivers devices | grep nvidia-driver | cut -d ":" -f2 | cut -d " " -f2 | sort -r)

echo -e "\n\e[92mDriver Version:\e[0m $current_driver"
echo -e "\n\e[31mAvailable Drivers:\e[0m\n\n$available_drivers\n"
}

color_test () {
echo -n "\n"
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
echo -n "\n"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias for my git bare repo dotfile stuff
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'