# shellcheck shell=bash
# shellcheck disable=SC2164
function yazp_upgrade() {
    if [ ! -e "$YAZPDIR" ]; then
        echo "$YAZPDIR was not found"
        return
    fi
    current_dir="$(pwd)"
    cd "$YAZPDIR"
    git pull || cd "$current_dir"
    source "$YAZPDIR/yazp.zsh"
    cd "$current_dir"
}
