# Function to source files if they exist
function yazp_add_file() {
    # $1: filename in $YAZPDIR
    [ -f "$YAZPDIR/$1" ] && source "$YAZPDIR/$1"
}
