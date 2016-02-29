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
	  	echo $(date '+%T %D');
	elif [[ $1 == '-e' ]]; then
	    echo $(date '+%T %d.%m.%y');
	elif [[ $1 == '-f' ]]; then
		DATESTR=$(echo $(date '+%T %d.%m.%y'));
		DATESTR=${DATESTR//\:/\_};
		DATESTR=${DATESTR//\./\_};
		DATESTR=${DATESTR// /\-};
		echo $DATESTR;
	else
		if [[ $1 == '-s' ]]; then
			echo $(date +%r);
	  	else
	  		echo $(date +%R);
	  	fi
	fi
};