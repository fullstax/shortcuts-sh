## SEARCH

# search caniuse.com
can() {
	input=""
	for el in $@; do
		input="$input $el";
	done
	QUERY=${input// /\%20};
	QUERY=${QUERY//-/\%2D};
	if [[ $1 ]]; then
		ochr http://caniuse.com/#search=$QUERY
	else
		ochr http://caniuse.com/
	fi
}

# open codepen or new pen
codepen() {
	if [[ $1 ]]; then
		if [[ $1 == 'new' ]]; then
			open http://codepen.io/pen;
		fi
	else
		open http://codepen.io/;
	fi
}

gist() {
	input="";
	for el in $@; do
		echo "";
	done
	if [[ $1 == 'new' ]]; then
		open http://gist.github.com;
	else
		open http://gist.github.com;
	fi
}

github() {
	input=""
	for el in $@; do
		input="$input $el";
	done
	QUERY=${input// /\%20};
	QUERY=${QUERY//-/\%2D};
	if [[ $1 ]]; then
		ochr https://github.com/search?q=$QUERY;
	else
		ochr https://github.com/;
	fi
}

# look up term on dictionary.reference.com
lookup() {
	input=""
	for el in $@; do
		input="$input $el";
	done
	QUERY=${input// /\%20};
	QUERY=${QUERY//-/\%2D};
	ochr "http://dictionary.reference.com/browse/$QUERY";
}

mdn() {
	input=""
	for el in $@; do
		if [[ $el == $1 ]]; then
			input="$el";
		else
	    	input="$input $el";
	    fi
	done
	QUERY=${input// /\+};
	QUERY=${QUERY//,/\%2C};
	QUERY=${QUERY//./\%2E};
	QUERY=${QUERY//-/\%2D};
	QUERY=${QUERY//\:/\%3A};
	ochr "https://developer.mozilla.org/en-US/search?q=$QUERY";
}

# Google mobile test
# https://testmysite.thinkwithgoogle.com/?url=https://fullstax.io
mobiletest() {
	if [[ $1 ]]; then 
		open "https://testmysite.thinkwithgoogle.com/?url=$1";
	else
		echo "No URL given";
	fi
}

# search npm
package() {
	QUERY="";
	for var in $@		
	do
		QUERY="$QUERY$var%20";
	done
	ochr "https://www.npmjs.com/search?q=$QUERY"
}

# http://design.google.com/resizer/#url=
resizer() {
	if [[ $1 ]]; then
		QUERY=$1;
		ochr http://design.google.com/resizer/#url=$(rawurlencode $QUERY);
	else
		ochr http://design.google.com/resizer/#url;
	fi
}

# Search Google
search() {
	input=""
	for el in $@; do
	    input="$input $el";
	done
	QUERY=${input// /\%20};
	QUERY=${QUERY//,/\%2C};
	QUERY=${QUERY//./\%2E};
	QUERY=${QUERY//-/\%2D};
	QUERY=${QUERY//\+/\%2B};
	QUERY=${QUERY//\:/\%3A};
	echo "Searching for:$input";
	echo "https://www.google.com/search?q=$QUERY&oq=$QUERY";
	ochr "https://www.google.com/search?q=$QUERY&oq=$QUERY";
}

# Search wikipedia
# Set $DEFAULT_WIKI_LANG to code of language you'd
# 	like to auto-search in.
DEFAULT_WIKI_LANG="en"
wiki() {
	# https://en.wikipedia.org/w/index.php?search=test+post+please+ignore
	input=""
	for el in $@; do
		if [[ $el == $1 ]]; then
			input="$el";
		else
	    	input="$input $el";
	    fi
	done
	QUERY=${input// /\+};
	QUERY=${QUERY//,/\%2C};
	QUERY=${QUERY//./\%2E};
	QUERY=${QUERY//-/\%2D};
	QUERY=${QUERY//\:/\%3A};
	echo "Searching for: $input";
	echo "https://$DEFAULT_WIKI_LANG.wikipedia.org/w/index.php?search=$QUERY";
	ochr "https://$DEFAULT_WIKI_LANG.wikipedia.org/w/index.php?search=$QUERY";
}

# Translate via Google, using auto-detect language
# Set $DEFAULT_LANG to the code of the language you'd 
# 	like to auto-translate to.
DEFAULT_LANG="en"
translate() {
	QUERY="";
	if [[ $1 == '-p' || $1 == '--paste' ]]; then
		QUERY=$(pbpaste);
		QUERY=${QUERY// /\%20};
		echo $QUERY;
		ochr "https://translate.google.com/?source=osdd#auto/$DEFAULT_LANG/$QUERY";
	else
		for var in $@		
		do
			QUERY="$QUERY$var%20";
		done
		echo $QUERY;
		echo "https://translate.google.com/?source=osdd#auto/$DEFAULT_LANG/$QUERY";
		ochr "https://translate.google.com/?source=osdd#auto/$DEFAULT_LANG/$QUERY";
	fi
}