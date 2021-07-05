function zsh_enable_theme() {
    # $1: theme name
    # $2: theme config file
    fpath+="$ZDOTDIR/plugins/$1"
    SETUP_PATH=$ZDOTDIR/plugins/$1/prompt_$1_setup
    if [ ! -e $SETUP_PATH ]; then
        ln -s $(ls $ZDOTDIR/plugins/$1/*.zsh-theme) $SETUP_PATH || \
        ln -s $(ls $ZDOTDIR/plugins/$1/*.plugin.zsh) $SETUP_PATH || \
        ln -s $(ls $ZDOTDIR/plugins/$1/*.zsh) $SETUP_PATH
    fi
    autoload -U promptinit; promptinit
    zsh_add_file "$2"
    prompt "$1"
}

function yazp_add_theme() {
    # $1: username/plugin_name
    # $2: config filename in ZDOTDIR
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2 | cut -d "." -f 1)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_enable_theme $PLUGIN_NAME $2
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        zsh_enable_theme $PLUGIN_NAME $2
    fi
}
