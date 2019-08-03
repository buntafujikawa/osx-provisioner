# 環境変数
export LANG=ja_JP.UTF-8
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
# see https://qiita.com/itochan/items/c536c783b3d03d37279f
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GOPATH=$HOME/go
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(rbenv init -)"
eval "$(fasd --init auto)"

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups


# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

###########################################
# カレントディレクトリ表示
autoload colors
colors

PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%}
 [%n]$ "

 PROMPT2='[%n]> '

##########################################
# anyframe
## https://qiita.com/mollifier/items/81b18c012d7841ab33c3
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init


########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias his='history'

## fasdのエイリアス
## https://github.com/clvv/fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

## anyframeのエイリアス
alias ehis='anyframe-widget-execute-history'
alias phis='anyframe-widget-put-history'
alias awco='anyframe-widget-checkout-git-branch'
alias awkill='anyframe-widget-kill'

## sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

## docker
alias doc='docker'
alias docc='docker ps'

#######################################
# Git
alias st='git status'
alias co='git checkout'
alias add='git add'
alias cm='git commit -m'
alias br='git branch'
alias diffg='git diff'
alias diffc='git diff --cached'
alias push='git push origin'
alias pusht='git push origin HEAD'
alias pull='git pull origin'
alias pullt='git pull origin HEAD'
alias lg='git log'
alias lgl='git log --oneline'
alias fetch='git fetch'
alias stash='git stash'
alias stashs='git stash save'
alias stashb='(){git stash apply stash@{$1}}'
alias stashl='git stash list'
alias rebase='git rebase'
alias rebasei='(){git rebase -i HEAD~$1}'
alias rebasec='git rebase --continue'
alias rebasea='git rebase --abort'

# Laravel
alias tinker='php artisan tinker'
alias migrate='php artisan migrate'
alias rollback='php artisan migrate:rollback'
alias refresh='php artisan refresh'
alias refreshs='php artisan refresh --seed'
alias seed='(){php artisan db:seed --class=$1}'


#
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
}
RPROMPT=$'$(vcs_info_wrapper)'

##########################################
#make widget
function _history_peco() {
    history | peco
}

zle -N _history_peco
bindkey '^p' _history_peco

