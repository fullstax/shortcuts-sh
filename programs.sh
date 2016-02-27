## PROGRAMS

# OPEN FILES/DIRECTORIES IN APPS
# Text Editor
	# Change DEFAULT_TE to change the text editor; defaults to Sublime
	# (Optional) Change "ost" to "o*", where * matches the desired editor's initials
DEFAULT_TE=sublime\ text;
ost() { 
	if [[ $1 ]]; then
		open -a $DEFAULT_TE $1;
	else
		open -a $DEFAULT_TE .; 
	fi
};
# Open finder
ofind() { 
	if [[ $1 ]]; then
		open -a finder $1;
	else
		open -a finder .;
	fi
};
	# Change DEFAULT_BROWSER to change the browser; defaults to chrome
	# (Optional) Change "ost" to "o*", where * matches the desired browsers's initials
DEFAULT_BROWSER=google\ chrome;
ochr() { 
	if [[ $1 ]]; then
		open -a $DEFAULT_BROWSER $1;
	else
		open -a $DEFAULT_BROWSER .;
	fi
};
# Open Terminal
oterm() {
	if [[ $1 ]]; then
		open -a terminal $1;
	else
		echo "No directory given.";
	fi
}

## PAID APPLICATIONS
# The following applications are paid applications that need to be purchased
# *These commands may work with trial versions

# Open irssi IRC client
irc() {
	irssi;
}

# ngrok
ngrok() {
	if [[ $1 == -s ]]; then
		~/ngrok http $2;
	else
		~/ngrok;
	fi
}

# Open Tower
tower() {
	# opens tower at path $1
	if [[ $1 ]]; then
		open -a tower $1;
	else 
		open -a tower;
	fi
}