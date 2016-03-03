export DIRECTORY=~/.bash/shortcuts-sh/
source "${DIRECTORY}/utilities.sh"
source "${DIRECTORY}/cline.sh"
source "${DIRECTORY}/programs.sh"
source "${DIRECTORY}/search.sh"

shortcuts() {
	if [[ $1 == "v" || $1 == "version" ]]; then
		echo "Shortcuts.sh v0.6.5";
	elif [[ $1 == "docs" ]]; then
		open https://github.com/fullstax/shortcuts-sh/blob/master/README.md;
	elif [[ $1 == 'i' || $1 == 'install' ]]; then
		if [[ $2 == 'programs' ]]; then
			if [[ $3 == 'st3' ]]; then
				printf '\nSHORTCUTS-SH\n***********\nDownloading Sublime\ Text\ Build\ 3103.dmg and placing in ~/Desktop.\n';
				cd ~/Desktop && { open https://download.sublimetext.com/Sublime%20Text%20Build%203103.dmg; open -a finder ~/Desktop;  cd -; };
			elif [[ $3 == 'chrome' ]]; then
				printf '\nSHORTCUTS-SH\n***********\nDownloading googlechrome.dmg and placing in ~/Desktop.\n';
				cd ~/Desktop && { open https://www.google.com/chrome/browser/thankyou.html?platform=mac; open -a finder ~/Desktop;  cd -; };
			elif [[ $3 == 'irssi' ]]; then
				printf '\nSHORTCUTS-SH\n***********\nupdating `brew` then `brew install`-ing irssi\n';
				brew update;
				brew install irssi;
				open https://irssi.org/documentation/;
			elif [[ $3 == 'ngrok' ]]; then
				printf '\nSHORTCUTS-SH\n***********\ndownloading ngrok zip, then unzipping in ~/\n';
				cd ~/ && { curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip; unzip ngrok-stable-darwin-amd64.zip;  cd -; };
			elif [[ $3 == 'tower' ]]; then
				printf '\nSHORTCUTS-SH\n***********\ndownloading Tower trial zip, then unzipping in ~/Desktop\n';
				cd ~/Desktop && { curl -O https://www.git-tower.com/download; unzip Tower-*.zip -d ~/Desktop;  cd -; };
			else
				printf "\nSHORTCUTS-SH\n***********\nGo to the following sites to download dependencies for programs.sh:\n";
				printf "* Sublime Text 3: https://www.sublimetext.com/3\n    Run \`$ shortcuts install programs st3\` to install.\n\n";
				printf "* Google Chrome: https://www.google.com/chrome/browser/desktop/index.html\n    Run \`$ shortcuts install programs chrome\` to install.\n\n";
				printf "* irssi: https://irssi.org/download/\n    Run \`$ shortcuts install programs irssi\` to install.\n\n";
				printf "* ngrok: https://ngrok.com/download\n    Run \`$ shortcuts install programs ngrok\` to install.\n\n";
				printf "* Tower: https://www.git-tower.com/\n    Run \`$ shortcuts install programs tower\` to install.\n\n";
			fi
		elif [[ $2 == 'cline' ]]; then
			if [[ $3 == 'doc' ]]; then
				printf "\nSHORTCUTS-SH\n***********\nGlobally installing Documentation.js via \`npm install -g\`\n";
				npm i -g documentation;
			elif [[ $3 == 'httpster' ]]; then
				printf "\nSHORTCUTS-SH\n***********\nGlobally installing Httpster via \`npm install -g\`\n";
				npm i -g httpster;
			elif [[ $3 == 'lorem' ]]; then
				printf "\nSHORTCUTS-SH\n***********\nGlobally installing Lorem-Ipsum via \`npm install -g\`\n";
				npm i lorem-ipsum --global;
			elif [[ $3 == 'py-md' ]]; then
				printf "\nSHORTCUTS-SH\n***********\nUpdating PIP using sudo, then installing Python Markdown package via \`pip install\`\n";
				sudo pip install --upgrade pip &&
				pip install markdown;
			else
				printf "\nSHORTCUTS-SH\n***********\nGo to the following sites to download dependencies for cline.sh:\n";
				printf "* Httpster: https://simbco.github.io/httpster/\n    Run \`$ shortcuts install cline httpster\` to install.\n\n";
				printf "* Lorem-Ipsum: https://www.npmjs.com/package/lorem-ipsum\n    Run \`$ shortcuts install cline lorem\` to install.\n\n";
				printf "* PHP Interactive Shell: http://php.net/downloads.php\n    PHP language package comes with an interactive shell; if you already have PHP installed, you do NOT need to re-download.\n\n";
				printf "* Python Interactive Shell: https://www.python.org/downloads/\n    Python language package comes with an interactive shell; if you already have Python installed, you do NOT need to re-download.\n\n";
				printf "* PIP Python Package downloader: https://pypi.python.org/pypi/pip#downloads\n\n"
				printf "* Python Markdown package: https://pythonhosted.org/Markdown/\n    *NOTE* PIP is required to be installed in order to run the following command.\n    Run \`$ shortcuts install cline py-md\` to install.\n\n"
			fi
		else
			printf "\nNo dependency group specified.";
			printf "Current source files with dependency groups:\n* cline\n* programs\n\n";
		fi
	elif [[ $1 == 'new' ]]; then
		if [[ $2 == 'issue' ]]; then
			printf "Enter an issue title: ";
			read ISSUE_TITLE;
			ISSUE_TITLE=${ISSUE_TITLE// /\%20};
			echo "Opening an issue titled '$ISSUE_TITLE' on Github";
			ochr https://github.com/fullstax/shortcuts-sh/issues/new?title=$ISSUE_TITLE;
		else
			printf "\nNo new request processed.\n";
			printf "Current requests you may generate by \`new\` include:\n* issue\n\n";
		fi
	elif [[ $1 == 'update' || $1 == 'pull' ]]; then
		cd ~/.bash/shortcuts-sh && { git pull; cd -; };
	else
		printf "*******************************\nWelcome to the Shortcuts.sh cli\n*******************************\nShortcuts for use in OS X Terminal\n     *********************     \nTo see the README/docs, type\n  $ shortcuts docs\nor open 'https://github.com/fullstax/shortcuts-sh/blob/master/README.md' in your preferred browser.\n*******************************\n";
	fi
}