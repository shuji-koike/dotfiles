# dotfiles

https://dotfiles.github.io/

## clone!

```sh
git clone git@github.com:shuji-koike/dotfiles.git ~/.dotfiles
```

## link!

```sh
ln -sf .dotfiles/zsh .zsh
ln -sf .zsh/.zshrc
ln -sf .dotfiles/git/.gitconfig
ln -sf .dotfiles/git/.gitignore
ln -sf .dotfiles/git/.tigrc
ln -sf .dotfiles/screen/.screenrc
ln -sf .dotfiles/vim/.vimrc

touch .zshrc.local

chmod 600 .zshrc .zshrc.local .zsh-history

# sudo chsh -s /bin/zsh $(whoami)
```

## that's it!

:trollface:

## want more?

### brew

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew bundle
# brew bundle dump --file=/tmp/Brewfile && ksdiff /tmp/Brewfile ~/.dotfiles/Brewfile
```

### ssh

```sh
ssh-add -K ~/.ssh/id_rsa
```

### atom

```sh
ln -sf .dotfiles/atom .atom
apm stars --install
```

### vscode

```sh
cd ~/Library/Application\ Support/Code/User
ln -sf ~/.dotfiles/vscode/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json
ln -sf ~/.dotfiles/vscode/snippets
```

### hyper

```sh
ln -sf .dotfiles/.hyper.js
```
