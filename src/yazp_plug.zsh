function zsh_enable_plugin() {
    # $1: plugin name
    zsh_add_file "plugins/$1/$1.plugin.zsh" || \
    zsh_add_file "plugins/$1/$1.zsh" || \
    zsh_add_file "plugins/$1/$1.sh"
}

function yazp_add_plugin() {
    # $1: username/plugin_name
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_enable_plugin $PLUGIN_NAME
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        zsh_enable_plugin $PLUGIN_NAME
    fi
}
