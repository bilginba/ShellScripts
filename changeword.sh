filename=$1
shopt -s nocasematch

if [ -f "$filename" ]
	then 
	cp $filename changedfile.txt
	chmod 777 changedfile.txt

	while [ 1 ]
	do
		echo -n -e '\e[91m\e[1m'"Enter input word:\033[0m "
		read word1 
		echo -n -e '\e[91m\e[1m'"New word:\033[0m " 
		read word2
		echo -n -e '\e[91m\e[1m'"Press e to exit, enter any key to continue:\033[0m "
		read closecheck
		sed -i "s/$word1/$word2/g" changedfile.txt
	
		if [ "$closecheck" = e ]
			then 
			echo "Output file created. Exitting..."
			break
			fi	
	done
else
	echo -e '\e[91m\e[1m'"File not found. Try Again!\033[0m"
	echo -n -e "\e[37mEnter target file:\033[0m"
	read filename
fi	
