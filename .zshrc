export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"

#alias mc='. /usr/lib/mc/mc-wrapper.sh'
alias c='/usr/bin/code .'
alias ave='f() { source ~/Documents/venvs/"$@"/bin/activate; };f' # activate python virtual env
alias cve='f() { cd ~/Documents/venvs/ && virtualenv "$@"; };f' # create python virtual env