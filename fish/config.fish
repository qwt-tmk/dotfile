if status is-interactive
    # Commands to run in interactive sessions can go here
end

# brew
set PATH /opt/homebrew/bin $PATH
# brew no auto upgrade
set -x HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK true

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

function push_upstream
    set current_branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    echo "git push --set-upstream origin $current_branch"
end

abbr --add gpss --function push_upstream
abbr --add g git
abbr --add ga git add
abbr --add gc gitmoji -c
abbr --add gl git log --graph
abbr --add gla git log --all --graph
abbr --add gd git diff
abbr --add gdd git diff @^ @
abbr --add gf git fetch --prune
abbr --add lg lazygit
abbr --add sl ls
abbr --add config 'cd ~/.config && nvim ~/.config/'
abbr --add v nvim
abbr --add vim nvim
abbr --add cl claude
abbr --add fb fabric-ai # depends on instllation source. maight be `fabric`.
abbr --add img wezterm imgcat

# starship initiation
starship init fish | source

# source local config file
if test -f ~/.config/fish/local.fish
	source ~/.config/fish/local.fish
end

# vs code shell integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

# direnv
direnv hook fish | source

# for cline
set term_program $TERM_PROGRAM
set cache_file (string replace -r '.*' (status current-filename) '' | string match -r '[^/]+$')
set cache_path (string join '' (or $XDG_CACHE_HOME "$HOME/.cache") "/p10k-instant-prompt-" $cache_file ".fish")

if test "$term_program" != "vscode" -a -r "$cache_path"
    source "$cache_path"
end

# mise activation
mise activate fish --shims | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/tomokikuwata/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# go path
set PATH ~/go/bin $PATH
