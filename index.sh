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
	elif [[ $1 == 'i' || $1 == 'install' ]]; then
		if [[ $2 == 'programs' ]]; then
			if [[ $3 == 'st3' ]]; then
				echo "";
			elif [[ $3 == 'chrome' ]]; then
				cd ~/ && { curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip; unzip ngrok-stable-darwin-amd64.zip;  cd -; };
			elif [[ $3 == 'irssi' ]]; then
				printf 'SHORTCUTS-SH\n***********\nupdating `brew` then `brew install`-ing irssi\n';
				brew update;
				brew install irssi;
			elif [[ $3 == 'ngrok' ]]; then
				printf 'SHORTCUTS-SH\n***********\ndownloading ngrok zip, then unzipping in ~/\n';
				cd ~/ && { curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip; unzip ngrok-stable-darwin-amd64.zip;  cd -; };
			elif [[ $3 == 'tower' ]]; then
				printf 'SHORTCUTS-SH\n***********\ndownloading Tower trial zip, then unzipping in ~/Desktop\n';
				cd ~/Desktop && { curl -O https://www.git-tower.com/download; unzip Tower-*.zip;  cd -; };
				echo "";
			else
				printf "SHORTCUS-SH\nGo to the following sites to download dependencies for programs.sh:";
				printf "Sublime Text 3: https://www.sublimetext.com/3\nRun $ install_programs i st3 to install.\n\n";
				printf "Google Chrome: https://www.google.com/chrome/browser/desktop/index.html\nRun $ install_programs i chrome to install.\n\n";
				printf "irssi: https://irssi.org/download/\nRun $ install_programs i irssi to install.\n\n";
				printf "ngrok: https://ngrok.com/download\nRun $ install_programs i ngrok to install.\n\n";
				printf "Tower: https://www.git-tower.com/\nRun $ install_programs i tower to install.\n\n";
			fi
		elif [[ $2 == 'cline' ]]; then
			echo "";
		fi
	else
		printf "*******************************\nWelcome to the Shortcuts.sh cli\n*******************************\nShortcuts for use in OS X Terminal\n     *********************     \nTo see the README/docs, type\n  $ shortcuts docs\nor open 'https://github.com/fullstax/shortcuts-sh/blob/master/README.md' in your preferred browser.\n*******************************\n";
	fi
}