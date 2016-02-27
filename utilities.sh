# Utility functions

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