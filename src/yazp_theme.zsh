# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091

function zsh_enable_theme() {
    # $1: theme name
    # $2: theme config file
    fpath+="$YAZPDIR/plugins/$1"
    SETUP_PATH=$YAZPDIR/plugins/$1/prompt_$1_setup
    if [ ! -e "$SETUP_PATH" ]; then
        ln -s "$(ls "$YAZPDIR"/plugins/"$1"/*.zsh-theme)" "$SETUP_PATH" ||
            ln -s "$(ls "$YAZPDIR"/plugins/"$1"/*.plugin.zsh)" "$SETUP_PATH" ||
            ln -s "$(ls "$YAZPDIR"/plugins/"$1"/*.zsh)" "$SETUP_PATH"
    fi
    autoload -U promptinit
    promptinit
    [ -f "$2" ] && source "$2"
    prompt "$1"
}

function yazp_add_theme() {
    # $1: username/plugin_name
    # $2: config filename in ZDOTDIR
    PLUGIN_NAME=$(echo "$1" | cut -d "/" -f 2 | cut -d "." -f 1)
    if [ -d "$YAZPDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_enable_theme "$PLUGIN_NAME" "$2"
    else
        git clone "https://github.com/$1.git" "$YAZPDIR/plugins/$PLUGIN_NAME"
        zsh_enable_theme "$PLUGIN_NAME" "$2"
    fi
}
