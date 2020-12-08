export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"
plugins=(git)


alias c='/usr/bin/code .'
alias s='/usr/bin/subl .'
alias sm='/usr/bin/smerge .'
alias ave='f() { source ~/Documents/venvs/"$@"/bin/activate; };f' # activate python virtual env
alias cve='f() { cd ~/Documents/venvs/ && virtualenv "$@"; };f' # create python virtual env