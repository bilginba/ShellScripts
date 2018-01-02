while [ 1 ]
do
echo -e "----------CALCULATOR----------------"
echo -e "|\e[4m\e[92mOPTIONS\033[0m          \e[4m\e[93mOPERATIONS\033[0m       |"       
echo -e "|   \e[92m1\033[0m  		  \e[93mADDITION\033[0m         |"
echo -e "|   \e[92m2\033[0m 		  \e[93mSUBTRACTION\033[0m      |"
echo -e "|   \e[92m3\033[0m  		  \e[93mMULTIPLICATION\033[0m   |"
echo -e "|   \e[92m4\033[0m  		  \e[93mDIVISION\033[0m         |"
echo -e "|   \e[92m5\033[0m  		  \e[93mMODULO\033[0m           |"
echo -e "|   \e[92m6\033[0m  		  \e[93mPOWER\033[0m            |"
echo -e "|   \e[92m7\033[0m  		  \e[93mSQUARE ROOT\033[0m      |"	
echo -e "----------CALCULATOR----------------"
echo ""
echo "This program executes operations with integers."
echo -n "Enter option: "
read option

case ${option} in  
   1) echo -n "Enter first number: "
	  read num1
	  if ! [[ "$num1" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Enter second number: "
	  read num2
	  if ! [[ "$num2" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
      b=$(($num1 + $num2))
      echo "Addition of $num1 and $num2 is $b" 
      ;;  
   2) echo -n "Enter first number: "
	  read num1
	  if ! [[ "$num1" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Enter second number: "
	  read num2
	  if ! [[ "$num2" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  b=$(($num1-$num2))
	  echo "Subtraction of $num1 and $num2 is $b"
	  ;;
   3) echo -n "Enter first number: "
	  read num1
	  if ! [[ "$num1" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Enter second number: "
	  read num2
	  if ! [[ "$num2" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
      b=$(($num1*$num2))
	  echo "Multiplication of $num1 and $num2 is $b"
	  ;;	 
   4) echo -n "Enter first number: "
	  read num1
	  if ! [[ "$num1" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Enter second number: "
	  read num2
	  if ! [[ "$num2" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
      b=$(($num1/$num2))
      echo "Division of $num1 by $num2 is $b"
      ;;
   5) echo -n "Enter first number: "
	  read num1
	  if ! [[ "$num1" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Enter second number: "
	  read num2
	  if ! [[ "$num2" =~ ^[0-9]+$ ]]
	  then
       echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
      b=$(($num1%$num2))
      echo "Modulo of $num1 by $num2 is $b"
      ;;
   6) echo -n "Enter first number: "
	  read num1
	  if ! [[ "$num1" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Enter second number: "
	  read num2
	  if ! [[ "$num2" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Power of $num1 by $num2 is "
	  echo "$num1^$num2" | bc
      ;; 
   7) echo -n "Enter number: "
	  read num
	  if ! [[ "$num" =~ ^[0-9]+$ ]]
	  then
        echo "Input must be integer!" 
		echo "Quitting..."
		sleep 1
        break
      fi
	  echo -n "Square root of $num is "
	  echo "scale=5;sqrt($num)" | bc
	  ;;
   *) echo "Wrong option!"
	  ;;
esac
echo -n "Try again [y/n]: "
read answer
if [ "$answer" = "y" ]; then 
	continue
elif [ "$answer" = "n" ]; then
	break
else
	echo "Wrong Option!"
	break
fi
done
