# shellcheck shell=bash
# shellcheck disable=SC2164
function yazp_upgrade() {
    if [ ! -e "$YAZPDIR" ]; then
        echo "$YAZPDIR was not found"
        return
    fi
    pushd "$YAZPDIR" > /dev/null 2>&1
    git pull || popd > /dev/null 2>&1
    source "$YAZPDIR/yazp.zsh"
    popd > /dev/null 2>&1
}
