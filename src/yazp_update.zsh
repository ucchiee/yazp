# shellcheck shell=bash
function yazp_update() {
    current_dir="$(dirname "$0")"
    cd "$YAZPDIR" || exit
    git pull
    cd $current_dir || exit
}
