# Function to source files if they exist
function zsh_add_file() {
    # $1: filename in $ZDOTDIR
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}
