
find /media/pi/ZUKE/MUSIC/ -type f | grep -P "\/\d \-" > ~/Desktop/renamedtracks.txt

sed  "s|^\(\(.\+\)/\(\d\) -\(.\+\)\)$|mv --backup=numbered \"\1\" \"\2/0\3 -\4\"|" ~/Desktop/renamedtracks.txt > ~/Desktop/renamedtracks.sh


