# Source functions
[ -f "./src/util.zsh" ] && source "src/util.zsh"
[ -f "./src/yazp_plug.zsh" ] && source "src/yazp_plug.zsh"
[ -f "./src/yazp_theme.zsh" ] && source "src/yazp_theme.zsh"
[ -f "./src/yazp_comp.zsh" ] && source "src/yazp_comp.zsh"

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
