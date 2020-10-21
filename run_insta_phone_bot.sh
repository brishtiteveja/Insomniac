#! /bin/bash

export HISTIGNORE='*sudo -S*'
password="aaanandaaa0595"

COUNTER=1
NOTRUNNING=1
REBOOT=100
RERUN=3600
SLEEPINT=900
SLEEPFOR=1200
while true; 
do
    usercmd="cat usernames.txt"
	cmd="python3 insomniac.py --repeat 180 --interact"
    tcmd="insomniac.py"
	res=$(ps aux | grep -v grep | grep $tcmd)

	if [ -z "$res" ] 
	then
		echo "Running the instabot again"
		echo $password | sudo -S -k sh kill_insta_phone_bot.sh 
		adb kill-server
		sleep 2
		adb reconnect 
		sleep 2
		cmd2=`$usercmd | perl -MList::Util=shuffle -e 'print shuffle<STDIN>' | xargs`
		echo "Current User list="$cmd2
		$usercmd | perl -MList::Util=shuffle -e 'print shuffle<STDIN>' | xargs $cmd > log_instabot.txt &
	else
		echo "-"
		NOTRUNNING=$[$NOTRUNNING +1]
		if [ $NOTRUNNING -ge $REBOOT ]
		then
			echo $NOTRUNNING
			echo "Phone will be reboot"
			#adb reboot
			sleep 10 
			echo $password | sudo -S -k sh kill_insta_phone_bot.sh 
			NOTRUNNING=1
		fi
	fi

	sleep 10 
	TIME=$(($COUNTER * 10))
	echo "Time="$TIME"sec"
	COUNTER=$[$COUNTER +1]

	#if [ $TIME -ge $RERUN ]
	#then
	#	echo "Insta bot will be killed and rerun now"
	#	#adb reboot
	#	sleep 10
	#	echo $password | sudo -S -k sh kill_insta_phone_bot.sh 
	#	COUNTER=1
	#fi

	if [ $TIME -ge $SLEEPINT ]
	then
		echo $password | sudo -S -k sh kill_insta_phone_bot.sh 
		echo "Insta bot will be sleeping for next "$SLEEPFOR" minutes"
		sleep $SLEEPFOR
		#adb reboot
		COUNTER=1
		TIME=$(($COUNTER * 10))
	fi
done
