# Utility functions

# encode URL using given input
rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

# get current time
ts(){
	if [[ $1 == '-d' ]]; then
		# timestamp with (US) date
	  	echo $(date '+%T %D');
	elif [[ $1 == '-e' ]]; then
		# timestamp with euro-style date
	    echo $(date '+%T %d.%m.%y');
	elif [[ $1 == '-f' ]]; then
		# url encoded timestamp
		DATESTR=$(echo $(date '+%T %d.%m.%y'));
		DATESTR=${DATESTR//\:/\_};
		DATESTR=${DATESTR//\./\_};
		DATESTR=${DATESTR// /\-};
		echo $DATESTR;
	else
		if [[ $1 == '-s' ]]; then
			# ...with seconds and TimeOfDay stamp
			echo $(date +%r);
	  	else
	  		# simple 24hr timestamp
	  		echo $(date +%R);
	  	fi
	fi
};