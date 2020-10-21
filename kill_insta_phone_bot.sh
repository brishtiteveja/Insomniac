#!/bin/sh

pid_adb=$(ps aux | grep -v grep |grep "fork-server" | tr -s " " | cut -d " " -f 2 | xargs)
echo $pid_adb
echo "aaanandaaa0595" | sudo -S -k kill $pid_adb > /dev/null 2>&1

pid_chrome=$(ps aux | grep -v grep |grep "Google Chrome" | tr -s " " | cut -d " " -f 2 | xargs) 
echo "aaanandaaa0595" | sudo -S -k kill $pid_chrome > /dev/null 2>&1

pid_insta=$(ps aux | grep -v grep |grep insta_phone_bot.py | tr -s " " | cut -d " " -f 2 | xargs) 
echo "aaanandaaa0595" | sudo -S -k kill $pid_insta > /dev/null 2>&1

pid_insomniac=$(ps aux | grep -v grep |grep insomniac.py | tr -s " " | cut -d " " -f 2 | xargs)
echo "aaanandaaa0595" | sudo -S -k kill $pid_insomniac > /dev/null 2>&1

