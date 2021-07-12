# shellcheck shell=bash
function yazp_update() {
    current_dir="$(pwd)"
    cd "$YAZPDIR" || exit
    # shellcheck disable=SC2164
    git pull || cd "$current_dir"
    source "$YAZPDIR/yazp.zsh"
    cd "$current_dir" || exit
}
