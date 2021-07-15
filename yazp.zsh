# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091

# export yazp dir
cd "$(dirname "$0")" || exit
YAZPDIR=$(pwd)
cd "$HOME" || exit
export YAZPDIR

# Source functions
source "$YAZPDIR/src/util.zsh"
source "$YAZPDIR/src/yazp_plug.zsh"
source "$YAZPDIR/src/yazp_theme.zsh"
source "$YAZPDIR/src/yazp_comp.zsh"
source "$YAZPDIR/src/yazp_upgrade.zsh"

# Plugin manager interface
function yazp() {
    # $1: name of plugin, theme, or completion
    if [ "$1" = "plug" ]; then
        shift
        yazp_add_plugin "$@"
    elif [ "$1" = "theme" ]; then
        shift
        yazp_add_theme "$@"
    elif [ "$1" = "comp" ]; then
        shift
        yazp_add_completion "$@"
    elif [ "$1" = "update" ]; then
        shift
        yazp_upgrade "$@"
    fi
}
