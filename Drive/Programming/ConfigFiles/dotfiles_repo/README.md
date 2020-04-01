# README

This repo contains my dotfiles, and a simple script to manage them using a bare repo. Based on a tutorial found [here](https://www.atlassian.com/git/tutorials/dotfiles).


### Initial setup
```
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
config remote add origin git@github.com:gonzolively/dotfiles.git
config push --set-upstream origin master
```

### Useage
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

### Deploy 

To deploy simply call the [deploy-dotfiles.sh](here) script using curl. Given that your shell config
has the 'config' alias in it this is all you need to do on your new computer to start using this repo!

`curl -Lks http://pathtorepo/deploy-dotfiles.sh | /bin/bash`
