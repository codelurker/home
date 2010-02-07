#!/bin/sh
###############
zipcode=$1
if [ -z "$zipcode" ]; then
echo "Please provide a zip code (Ex: weather 03301)"
else
unset response
# Add a backslash (\) after -dump-width 300 if this line splits
# across two lines; Should be one distinct line:
WEATHER="$(elinks -dump -dump-width 50 "http://mobile.wunderground.com/cgi-bin/findweather/getForecast?query=${zipcode}" | grep -A36 Updated)"
if [ -z "$WEATHER" ]; then
response="No Results for $zipcode"
echo "${response}"
else
response[1]="$(echo "$WEATHER" | grep -Eo 'Observed.*' | sed s/\ *\|\ */\|/g | awk -F\| '{print "Weather: " $1}')"
response[2]="$(echo "$WEATHER" | grep -Eo 'Updated.*' |sed s/\ *\|\ */\|/g |awk -F\| '{print $1}')"
response[3]="$(echo "$WEATHER" | grep -Eo 'Temperature.*' | sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}' | sed s/DEG/\ /g )"
response[4]="$(echo "$WEATHER" | grep -Eo 'Windchill.*' | sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}'| sed s/DEG/\ /g)"
response[5]="$(echo "$WEATHER" | grep -Eo 'Wind.*' | sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}')"
response[6]="$(echo "$WEATHER" | grep -Eo 'Conditions.*' | sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}')"
response[7]="$(echo "$WEATHER" | grep -Eo 'Humidity.*' |sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}')"
response[8]="$(echo "$WEATHER" | grep -Eo 'UV.*' |sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}')"
response[9]="$(echo "$WEATHER" | grep -Eo 'Sunrise.*' |sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}'| sed s/DEG/\ /g)"
response[10]="$(echo "$WEATHER" | grep -Eo 'Sunset.*' |sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}')"
response[11]="$(echo "$WEATHER" | grep -Eo 'Moon\ Rise.*' |sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}'| sed s/DEG/\ /g)"
response[12]="$(echo "$WEATHER" | grep -Eo 'Moon\ Set.*' |sed s/\ *\|\ */\|/g | awk -F\| '{print $1 ": " $2}')"

for index in `seq 1 12`; do
if [ -n "${response[$index]}" ]; then
echo "${response[$index]}"
fi
let "index = $index + 1"
done
fi
fi 
