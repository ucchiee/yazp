# shellcheck shell=bash
function yazp_update() {
    current_dir="$(pwd)"
    cd "$YAZPDIR" || exit
    # shellcheck disable=SC2164
    git pull || cd "$current_dir"
    cd "$current_dir" || exit
}
