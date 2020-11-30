#!/bin/bash

if [ $# != 2 ];then
	echo "ERROR: wrong number of input parameters." 1>&2
	echo "usage:$0 <raw_data> <new filename> that transforms raw json file into program reable(Python,R...) new json file."
        exit 1	
fi

filename=$1
newfilename=$2

sed 's/$/,/g' $filename |
	sed '$ s/.$//' |
	sed '1i\[' |
	sed '$a\]' > $newfilename
