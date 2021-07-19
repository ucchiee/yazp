# shellcheck shell=bash
# shellcheck disable=SC2164
function yazp_update() {
    find "$YAZPDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 -P16 -n1 git -C {} pull
}
