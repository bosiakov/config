# Config

Personal checklist for setting up a new dev environment.

```
curl https://raw.githubusercontent.com/bosiakov/config/master/setup_fedora.sh > ~/Downloads/setup_fedora.sh && bash ~/Downloads/setup_fedora.sh
```

Setup VS Code:

```
curl https://raw.githubusercontent.com/bosiakov/config/master/settings.json > ~/.config/Code/User/settings.json
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

Anti-procrastionation mode:

```
mkdir ~/.hosts && curl https://raw.githubusercontent.com/bosiakov/config/master/.hosts/procrast_hosts > ~/.hosts/procrast_hosts && curl https://raw.githubusercontent.com/bosiakov/config/master/.hosts/noprocrast_hosts > ~/.hosts/noprocrast_hosts
mkdir ~/bin && curl https://raw.githubusercontent.com/bosiakov/config/master/work.sh > ~/bin/work.sh
```