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

# search npm
package() {
	QUERY="";
	for var in $@		
	do
		QUERY="$QUERY$var%20";
	done
	ochr "https://www.npmjs.com/search?q=$QUERY"
}