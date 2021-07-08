function yazp_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$YAZPDIR/plugins/$PLUGIN_NAME" ]; then
        # For completions
		completion_file_path=$(ls $YAZPDIR/plugins/$PLUGIN_NAME/_*)
		fpath+="$(dirname "${completion_file_path}")"
        yazp_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$YAZPDIR/plugins/$PLUGIN_NAME"
		fpath+=$(ls $YAZPDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZDOTDIR/.zcompdump ] && rm $ZDOTDIR/.zcompdump
    fi
	completion_file="$(basename "${completion_file_path}")"
	if [ "$2" = true ] && compinit "${completion_file:1}"
}
