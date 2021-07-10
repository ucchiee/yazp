# shellcheck shell=bash

function zsh_enable_plugin() {
    # $1: plugin name
    # $2: specified file name to source
    yazp_add_file "plugins/$1/$1.plugin.zsh" ||
        yazp_add_file "plugins/$1/$1.zsh" ||
        yazp_add_file "plugins/$1/$2"
}

function yazp_add_plugin() {
    # $1: username/plugin_name
    # $2: Specified file name to source
    PLUGIN_NAME=$(echo "$1" | cut -d "/" -f 2)
    if [ -d "$YAZPDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_enable_plugin "$PLUGIN_NAME" $2
    else
        git clone "https://github.com/$1.git" "$YAZPDIR/plugins/$PLUGIN_NAME"
        zsh_enable_plugin "$PLUGIN_NAME" $2
    fi
}
