
echo Refer: https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

rsync -avzhe ssh --progress /Users/tay/Music/Amazon\ Music/* pi@192.168.1.73:"/media/pi/JUKE/Music/Amazon\ Music/"

echo Refer: https://askubuntu.com/questions/533690/rsync-with-special-character-files-not-working-between-mac-and-linux

echo This if some accepted characters didn't translate well: rsync -avzh --iconv=utf-8-mac,utf-8 -e ssh --progress /Users/tay/Music/Amazon\ Music/* pi@192.168.1.73:"/media/pi/JUKE/Music/Amazon\ Music/"

