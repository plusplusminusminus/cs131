#!/bin/bash

file=$1


IFS=","
while read line
do
        set $line
        if [ "$2" == "USA" ] ;
	then
		deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $20}'`
		echo $deathCnt >> selfHarmDeathsUSA.txt
	elif [ "$2" == "CHN" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsCHN.txt
	elif [ "$2" == "RUS" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsRUS.txt
	elif [ "$2" == "IND" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsIND.txt
        elif [ "$2" == "IRN" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsIRN.txt
        elif [ "$2" == "GBR" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $20}'`
                echo $deathCnt >> selfHarmDeathsGBR.txt
        elif [ "$2" == "UKR" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsUKR.txt
        elif [ "$2" == "DEU" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsDEU.txt
        elif [ "$2" == "CAN" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsCAN.txt
        elif [ "$2" == "FRA" ] ;
        then
                deathCnt=`echo $line | awk 'BEGIN {FS=" "} {print $19}'`
                echo $deathCnt >> selfHarmDeathsFRA.txt
        fi
	
done < $file

