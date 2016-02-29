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

github() {
	input=""
	for el in $@; do
		input="$input $el";
	done
	QUERY=${input// /\%20};
	QUERY=${QUERY//-/\%2D};
	if [[ $1 ]]; then
		if [[ $1 -eq -u ]]; then
			ochr https://github.com/;

		else
			ochr https://github.com/search?q=$1;
		fi
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