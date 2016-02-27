## COMMAND LINE SHORTCUTS

install_cline() {
	
}

# aliases
alias install="npm install"
alias installsd="npm install --save-dev"
alias installs="npm install --save"
alias installg="npm install -g"
alias update="npm update"
alias run="npm run"
alias uninstall="npm uninstall"
alias standby="pmset sleepnow"

# generates documentation via Documentation.js (http://bit.ly/1QzI3Sp)
doc() {
	if [[ $1 ]]; then
		if [[ $2 ]]; then
			documentation $1 -f md --github > $2.md;
		else 
			documentation $1 -f md --github > README.md;
		fi
	else
		echo "No source file given."
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