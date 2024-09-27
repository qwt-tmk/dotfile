if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH /opt/homebrew/bin $PATH

# peco bindings
source ~/.config/fish/functions/peco.fish
bind \c] peco_select_ghq
bind \c_ peco_select_cd
bind \cr peco_select_history
bind \cg peco_select_z

# abbreviation
abbr --add ll ls -l
abbr --add la ls -a
abbr --add lla ls -la
abbr --add gs git status
abbr --add gb git branch
abbr --add gba git branch -a
abbr --add gw git switch
abbr --add gwm git switch main
abbr --add gwc git switch -c
abbr --add gpl git pull
abbr --add gps git push
abbr --add tf terraform
abbr --add c clear

function push_upstream
    set current_branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    echo "git push --set-upstream origin $current_branch"
end

abbr --add gpss --function push_upstream
abbr --add ga git add
abbr --add gc gitmoji -c
abbr --add gl git log --graph
abbr --add gla git log --all --graph
abbr --add gd git diff
abbr --add gdd git diff @^ @
abbr --add gf git fetch --prune
abbr --add sl ls
abbr --add config 'cd ~/.config && nvim ~/.config/'
abbr --add vim nvim
abbr --add astrn 'cd ~/astrn-shop/'

# zscaler ca bundle
set -x SSL_CERT_FILE ~/.zscaler/ca_bundle.crt
set -x AWS_CA_BUNDLE ~/.zscaler/ca_bundle.crt
set -x PIP_CERT ~/.zscaler/ca_bundle.crt
set -x REQUESTS_CA_BUNDLE ~/.zscaler/ca_bundle.crt
set -x NODE_EXTRA_CA_CERTS ~/.zscaler/ca_bundle.crt
set -x XDG_CONFIG_HOME ~/.config

# starship initiation
starship init fish | source

# golang
set PATH $PATH $(go env GOPATH)/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniforge/base/bin" $PATH
    end
end
# <<< conda initialize <<<
conda deactivate

