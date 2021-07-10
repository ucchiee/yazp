# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091

# export yazp dir
cd "$(dirname "$0")" || exit
YAZPDIR=$(pwd)
export YAZPDIR

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
    if [ "$type" = "plug" ]; then
        yazp_add_plugin "$@"
    elif [ "$type" = "theme" ]; then
        yazp_add_theme "$@"
    elif [ "$type" = "comp" ]; then
        yazp_add_completion "$@"
    fi
}
