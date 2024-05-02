#! /bin/bash

IFS=$'\n'
data=$(< ../cause_of_deaths.csv)
# list of countries that have the highest casualties
countries=`sed -E -n '/^([^,]*,){2}2019,/p' ../cause_of_deaths.csv | awk -f s.awk | sort -nr -k 2 -t ,| head | cut -f1 -d,`
features=(
    'Country/Territory'
    'Year'
    'Digestive Diseases'
    'Cirrhosis and Other Chronic Liver Diseases'
    'Chronic Kidney Disease'
    'Diabetes Mellitus'
    'Chronic Respiratory Diseases'
    'Lower Respiratory Infections'
)

i=1
for feature in "${features[@]}"
do
	indexes[i]=`head -n 1 ../cause_of_deaths.csv | awk -F, -v feature="$feature" '{for(i=1;i<34;i++) if ($i == feature) print i}'`
	i+=1
done
newdata=`echo "$data" | cut -f $(IFS=$','; echo "${indexes[*]}") -d,`

file="generated_data.csv"
printf "Country/Territory,Year,Total Organ-Related Casualties\n" > $file

for record in $newdata
do
	country=$(echo $record | awk -F, '{ print $1}')
	year=$(echo $record | awk -F, '{ print $2}') 
	if [[ "${IFS}$countries${IFS}" =~ "${IFS}$country${IFS}" ]]; then
		death_count=$(echo $record | awk -F, '{ for(i=3;i<=NF;i++) { sum+=$i }; print sum }')
		printf "$country,$year,$death_count\n" >> $file
	fi

done
