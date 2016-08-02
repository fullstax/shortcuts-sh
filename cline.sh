## COMMAND LINE SHORTCUTS

# aliases
  # npm
  alias install="npm install"
  alias installsd="npm install --save-dev"
  alias installs="npm install --save"
  alias installg="npm install -g"
  alias update="npm update"
  alias run="npm run"
  alias uninstall="npm uninstall"
  # other apps
  alias be="bundle exec" # for bundle script execution
  alias crapp="create-react-app" # alias for c-r-a React boilerplate
  alias mdm="middleman" # alias for middleman
  alias ngrok="~/ngrok" # alias from ./ngrok
  alias standby="pmset sleepnow" # put computer on "standbye" mode
  # CLine aliases
  alias cpr='cp -r';
  alias rmr='rm -r';
  alias lsa='ls -la';
  alias lsl='ls -l';
  alias mkdp='mkdir -p';

# generates documentation via Documentation.js (http://bit.ly/1QzI3Sp)
doc() {
	if [[ $1 ]]; then
		if [[ $2 ]]; then
			documentation $1 -f md --github > $2.md;
		else 
			FILENAME=$1;
			stripped=${FILENAME%.es6};
			stripped=${stripped%.js};
			stripped=${stripped##*/};
			if test -f ./docs
			then
				# true
				documentation $1 -f md --github > ./docs/$stripped.md;
			else
				# false
				mkdir ./docs;
				documentation $1 -f md --github > ./docs/$stripped.md;
			fi
		fi
	else
		echo "No source file given."
	fi
}

# edit bash profile/rc
	# Change variable BASH_FILE to appropriate bash file 
BASH_FILE='bashrc'
ebash() {
	open -a 'Sublime Text' ~/.$BASH_FILE;
}

# lorem-ipsum command line generator
li() {
	if [[ $1 == '-c' ]]; then
		# copy to clipboard
		if [[ $2 ]]; then
			if [[ $3 ]]; then
				if [[ $4 ]]; then
					COUNT=$2
					UNIT=$3
					FORMAT=$4
					lorem-ipsum --units $UNIT --count $COUNT --format $FORMAT | pbcopy;
				else
					COUNT=$2
					UNIT=$3
					lorem-ipsum --units $UNIT --count $COUNT --format $FORMAT | pbcopy;
				fi
			else
				COUNT=$2
				lorem-ipsum --units sentence --count $COUNT --format plain | pbcopy;
			fi
		else
			lorem-ipsum --units sentence --count 1 --format plain | pbcopy;
		fi
	elif [[ $1 == '-o' ]]; then
		# output to file
		if [[ $3 ]]; then
			if [[ $4 ]]; then
				if [[ $5 ]]; then
					COUNT=$3
					UNIT=$4
					FORMAT=$5
					lorem-ipsum --units $UNIT --count $COUNT --format $FORMAT > $2;
				else
					COUNT=$3
					UNIT=$4
					lorem-ipsum --units $UNIT --count $COUNT --format $FORMAT > $2;
				fi
			else
				COUNT=$3
				lorem-ipsum --units sentence --count $COUNT --format plain > $2;
			fi
		else
			lorem-ipsum --units sentence --count 1 --format plain > $2;
		fi
	else
		# print to terminal
		if [[ $1 ]]; then
			if [[ $2 ]]; then
				if [[ $3 ]]; then
					COUNT=$1
					UNIT=$2
					FORMAT=$3
					lorem-ipsum --units $UNIT --count $COUNT --format $FORMAT;
				else
					COUNT=$1
					UNIT=$2
					lorem-ipsum --units $UNIT --count $COUNT --format $FORMAT;
				fi
			else
				COUNT=$1
				lorem-ipsum --units sentence --count $COUNT --format plain;
			fi
		else
			lorem-ipsum --units sentence --count 1 --format plain;
		fi
	fi
}

# convert markdown file to HTML via markdown_py
markdown() { 
	if [ $2 ]; then
		echo "<body class=\"container\"><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" />" > $2.html;
		python -m markdown $1.md >> $2.html;
		echo "</div>" >> $2.html;
	elif [ $1 ]; then
		echo "<body class=\"container\"><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" />" > $1.html;
		python -m markdown $1.md >> $1.html;
		echo "</div>" >> $1.html;
	else
		echo No file specified;
	fi
}

# make directory, then CD into it
mkcd() {
	if [ $1 ]; then
		mkdir $1 && cd $1;
	else
		echo "Not a valid directory name or invalid location to create a directory";
	fi
}

# SERVERS
	# Start local server environment using built-in language REPL servers
		# change variable DEFAULT_PORT to change default port that server(o) serves to
		# change variable DEFAULT_BROWSER to change default browsers that servero opens
DEFAULT_PORT=11011;
server() {
	echo $1;
	if [ $1 == 'js' ]; then
		if [ $2 ]; then
			httpster -p $2;
		else
			httpster -p $DEFAULT_PORT;
		fi
	elif [ $1 == 'php' ]; then
		if [ $2 ]; then
			php -S localhost:$2;
		else
			php -S localhost:$DEFAULT_PORT;
		fi
	elif [ $1 == 'py' ]; then
		if [ $2 ]; then
			python -m SimpleHTTPServer $2;
		else
			python -m SimpleHTTPServer $DEFAULT_PORT;
		fi
	elif [ $1 == 'ruby' ]; then
		if [ $2 ]; then
			ruby -run -e httpd . -p $2;
		else
			ruby -run -e httpd . -p $DEFAULT_PORT;
		fi
	else
		if [ $2 ]; then
			httpster -p $2;
		else
			httpster -p $DEFAULT_PORT;
		fi
	fi
};

# Opens server in Chrome, then starts server at desired port
DEFAULT_BROWSER='Google Chrome';
servero() {
	if [ $1 == 'js' ]; then
		if [ $2 ]; then
			open -a "$DEFAULT_BROWSER" http://localhost:$2;
			httpster -p $2;
		else
			open -a "$DEFAULT_BROWSER" http://localhost:$DEFAULT_PORT;
			httpster -p $DEFAULT_PORT;
		fi
	elif [ $1 == 'php' ]; then
		if [ $2 ]; then
			open -a "$DEFAULT_BROWSER" http://localhost:$2 &&
			php -S localhost:$2;
		else
			open -a "$DEFAULT_BROWSER" http://localhost:$DEFAULT_PORT &&
			php -S localhost:$DEFAULT_PORT;
		fi
	elif [ $1 == 'py' ]; then
		if [ $2 ]; then
			open -a "$DEFAULT_BROWSER" http://localhost:$2 &&
			python -m SimpleHTTPServer $2;
		else
			open -a "$DEFAULT_BROWSER" http://localhost:$DEFAULT_PORT &&
			python -m SimpleHTTPServer $DEFAULT_PORT;
		fi
	elif [ $1 == 'ruby' ]; then
		if [ $2 ]; then
			open -a "$DEFAULT_BROWSER" http://localhost:$2 &&
			ruby -run -e httpd . -p $2
		else 
			open -a "$DEFAULT_BROWSER" http://localhost:$DEFAULT_PORT &&
			ruby -run -e httpd . -p $DEFAULT_PORT
		fi
	else
		if [ $2 ]; then
			open -a "$DEFAULT_BROWSER" http://localhost:$2 &&
			httpster -p $2;
		else
			open -a "$DEFAULT_BROWSER" http://localhost:$DEFAULT_PORT &&
			httpster -p $DEFAULT_PORT;
		fi
	fi
};