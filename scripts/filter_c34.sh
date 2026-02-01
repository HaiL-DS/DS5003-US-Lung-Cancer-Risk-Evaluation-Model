#!/bin/bash

# Script to filter C34 Lung cancer variants:
#091 Lung (C34)
#092 	Squamous cell carcinoma (8050?078,8083?084)
#093 	Adenocarcinoma (8140,8211,8230?231,8250?260,8323,8480?490,8550?552,8570?574,8576)
#094 	Small cell carcinoma (8041?045)
#095 	Large cell carcinoma (8010?012,8014?031,8035,8310)
#096 	Other specified carcinoma
#097 	Sarcoma (8800?811,8830,8840?921,8990?991,9040?044,9120?133,9150,9540?581)
#098 	Other morphology
#099 	Unspecified morphology (8000-8005)
#100	Main bronchus (C34.0)
#101	Upper lobe (C34.1)
#102	Middle lobe (C34.2)
#103	Lower lobe (C34.3)
#104	Other and unspecified parts (C34.8-9)

# This script is for demonstration purposes only

# creat the .csv file with headers, separated by comma
echo "sex,c34_site,age_group,num_cases,person_years" > us_c34.csv

# filter records with the second column's value between 91 and 104, then append the records to us_c34.csv
# example for the state of Alabama
cat Alabama_384005199.csv | awk -F',' '$2 >= 91 && $2 <= 104 && $2 ~ /^[0-9]+$/' >> us_c34.csv 

# add a new column to the beginning, recording state information
cat us_c34.csv | awk -F',' 'BEGIN {OFS=","} NR==1 {print "state",$0} NR>1 {print "Alabama",$0}' > temp.csv && mv temp.csv us_c34.csv

# same process for all the other states
cat Alaska_384005099.csv | awk -F',' '$2 >= 91 && $2 <= 104 && $2 ~ /^[0-9]+$/' | awk -F',' 'BEGIN {OFS=","} {print "Alaska",$0}' > alaska.csv
cat alaska.csv >> us_c34.csv













