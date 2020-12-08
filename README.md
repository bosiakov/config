# Config

Personal checklist for setting up a new dev environment.

```
curl https://raw.githubusercontent.com/bosiakov/config/master/setup_fedora.sh > ~/Downloads/setup_fedora.sh && bash ~/Downloads/setup_fedora.sh
```

Setup ZSH:

```
curl https://raw.githubusercontent.com/bosiakov/config/master/.zshrc > ~/.zshrc
```

Setup Git:

```
curl https://raw.githubusercontent.com/bosiakov/config/master/.gitignore > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

curl https://raw.githubusercontent.com/bosiakov/config/master/.gitconfig > ~/.gitconfig
```

SSH:

```
curl https://raw.githubusercontent.com/bosiakov/config/master/ssh_config > ~/.ssh/config
```
