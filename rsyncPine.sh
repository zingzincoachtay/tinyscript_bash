
Applications            SanDisk                 tmbootpicker.efi      toCirrus          toJUKE
Backups.backupdb        donotneed               to3TB           toDesktop               toWillow

rsync -avzhe ssh --progress /Volumes/Pine/donotneed pi@10.10.10.2:"/media/pi/Willow/"
rsync -avzhe ssh --progress /Volumes/Pine/toJUKE    pi@10.10.10.2:"/media/pi/Willow/"
rsync -avzhe ssh --progress /Volumes/Pine/toWillow  pi@10.10.10.2:"/media/pi/Willow/"
rsync -avzhe ssh --progress /Volumes/Pine/toCirrus  /Users/tay/Desktop/
rsync -avzhe ssh --progress /Volumes/Pine/toDesktop /Users/tay/Desktop/

