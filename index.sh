export DIRECTORY=~/.bash/shortcuts-sh/
source "${DIRECTORY}/utilities.sh"
source "${DIRECTORY}/cline.sh"
source "${DIRECTORY}/programs.sh"
source "${DIRECTORY}/search.sh"

shortcuts() {
	if [[ $1 == "v" || $1 == "version" ]]; then
		echo "0.5.0";
	elif [[ $1 == "docs" ]]; then
		open https://github.com/fullstax/shortcuts-sh/blob/master/README.md;
	else
		printf "*******************************\nWelcome to the Shortcuts.sh cli\n*******************************\nShortcuts for use in OS X Terminal\n     *********************     \nTo see the README/docs, type\n  $ shortcuts docs\nor open 'https://github.com/fullstax/shortcuts-sh/blob/master/README.md' in your preferred browser.\n*******************************\n";
	fi
}