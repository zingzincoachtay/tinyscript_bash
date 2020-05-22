
echo Will show 'hail' if hail is in the forecast
curl -sL http://www.emergencyemail.org/wx/us/IN/18119.asp | pup 'div.main' | grep -i hail

echo
echo Here is a weather forecast link:
echo https://www.emergencyemail.org/wx/us/IN/18119.asp
