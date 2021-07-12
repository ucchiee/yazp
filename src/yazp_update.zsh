# shellcheck shell=bash
# shellcheck disable=SC2164
function yazp_update() {
    current_dir="$(pwd)"
    cd "$YAZPDIR" || echo "$YAZPDIR was not found" && return
    git pull || cd "$current_dir"
    source "$YAZPDIR/yazp.zsh"
    cd "$current_dir"
}
