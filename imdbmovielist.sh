echo  "Connecting to the website. Please wait."
sleep 1.5
if [[ `wget -S --spider "http://www.imdb.com/chart/boxoffice?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2773216402&pf_rd_r=1J79K6HNVXW0G9X6JJK7&pf_rd_s=right-7&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_cht_hd"  2>&1 | grep 'HTTP/1.1 200 OK'` ]] 
then 
	if [ -f website.txt ] 
	then
	echo 
	mv website.txt ../
	echo "Current directory includes unnecessary website.txt file. Moving it to the parent directory. Wait a second."
	sleep 0.6
	fi
	
	wget -q "http://www.imdb.com/chart/boxoffice?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2773216402&pf_rd_r=15V48831ESNKKAP8NE9E&pf_rd_s=right-7&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_cht_hd" -O website.txt
	echo "Connected to the website."
	echo ""
	echo "This program lists the movies in the IMBD Box Office."

	grep '^title=".*</a>$' website.txt > movies.txt

	tail -n +2 movies.txt > moviestemp.txt && mv moviestemp.txt movies.txt

	sed -i "s/title=\"//g" movies.txt

	sed -i "s/<\/a>//g" movies.txt

	echo "" > movielist.txt
	input="movies.txt"
	while IFS= read line
	do
		name=$(echo $line | sed 's/.*>//g')

		temp1=$(echo $line | sed 's/ (dir.*//g')
		director=$(echo $temp1 | sed 's/"//g')

		temp2=$(echo $line | sed 's/.*(dir.), //g')
		cast=$(echo $temp2 | sed 's/" >.*//g')
	
		echo -e "-----------------------------------------------------------" >> movielist.txt
	
		echo -e '\e[91m\e[1m'"Movie Title \e[39m:\033[0m \e[96m$name\033[0m" >> movielist.txt
 
		echo -e '\e[91m\e[1m'"Director \e[39m:\033[0m \e[96m$director\033[0m" >> movielist.txt

		echo -e '\e[91m\e[1m'"Cast List \e[39m:\033[0m \e[96m$cast\033[0m" >> movielist.txt
	
		echo -e "-----------------------------------------------------------"  >> movielist.txt
	
		sleep 0.2
	
		echo " " >> movielist.txt
	
	done < "$input"
	echo "$(cat movielist.txt)"
	rm movies.txt
	rm website.txt
	rm movielist.txt
else 
	echo ""
	echo "Website connection failed!"
fi
