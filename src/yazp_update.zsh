# shellcheck shell=bash
function yazp_update() {
    current_dir="$(pwd)"
    cd "$YAZPDIR" || exit
    git pull
    cd "$current_dir" || exit
}
