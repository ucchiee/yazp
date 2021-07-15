# shellcheck shell=bash
# shellcheck disable=SC2164
function yazp_upgrade() {
    if [ ! -e "$YAZPDIR" ]; then
        echo "$YAZPDIR was not found"
        return
    fi
    pushd "$YAZPDIR"
    git pull || popd
    source "$YAZPDIR/yazp.zsh"
    popd
}
