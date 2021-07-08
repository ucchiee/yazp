# export yazp dir
export YAZPDIR=$(cd $(dirname $0 );pwd)

# Source functions
source "$YAZPDIR/src/util.zsh"
source "$YAZPDIR/src/yazp_plug.zsh"
source "$YAZPDIR/src/yazp_theme.zsh"
source "$YAZPDIR/src/yazp_comp.zsh"

# Plugin manager interface
function yazp() {
    # $1: name of plugin, theme, or completion
    type=$1
    shift
    if [ $type = "plug" ]; then
        yazp_add_plugin $@
    elif [ $type = "theme" ]; then
        yazp_add_theme $@
    elif [ $type = "tool" ]; then
        yazp_add_completion $@
}
