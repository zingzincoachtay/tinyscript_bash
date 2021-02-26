
echo This script will display the best HDMI mode and group.

tvservice -d ~/Desktop/edid.dat

edidparser edid.dat | grep pref

echo hdmi_group = 0 (Auto-detect from EDID)
echo hdmi_group = 1 (CEA, Consumer Electronics Association, the standard typically used by TVs)
echo hdmi_group = 2 (DMT, Display Monitor Timings, the standard typically used by monitors)
echo The current /boot/config.txt is set to:
cat /boot/config.txt | grep hdmi_group

echo Full description of hdmi_mode: https://www.raspberrypi.org/documentation/configuration/config-txt/video.md
echo The current /boot/config.txt is set to:
cat /boot/config.txt | grep hdmi_mode

