#!/bin/bash

# NIST Scraper
# Author: Jacinta Hayward
# Last date modified: 21/08/2022

# Prints the name of the script in blue. 
echo -e "\033[94m \nThis is a bash script that will analyse the CVE Vulnerability Index from the National Institute of Science and Technology (NIST)."

# Asks the user to input a password and pulls the hashed password that is stored in secret.txt
get_sha256sum() {
    echo -n $1 | sha256sum | cut -f 1 -d ' ' # cuts the endspace off of the hashed password that the user inputs
}

# Gets the hash from the secret.txt file
secret_sha=$(cat additional.txt)

# Ask's the user to type a secret password (input is hidden and times out within 15 seconds if there is no input)
read -t15 -sp "Please type your password: " pass_var
echo -e '\n'

# Checks the hashed user inputted password against the hash contained in the secret.txt file.
# If the incorrect password is inputted, then the script will exit. If the correct password is entered, this will grant access and allow the script to continue. 
if [ "$(get_sha256sum $pass_var)" = "$secret_sha" ]; then
    echo -e "\033[32m \nAccess Granted!"
else
    echo -e "\033[31m \nAccess Denied!" 
    exit 1
fi

# Base URL for API call to NIST website
base_url="https://services.nvd.nist.gov/rest/json/cves/1.0"
echo -e "\n"

# Gets the start/end dates to pull down all CVE's from this time period and with the severity level that the user requests. 
read -p "Enter a start date for the timeframe you would like displayed with this format YYYY-MM-DD: " start_date
read -p "Enter an end date for the timeframe you would like displayed with this format YYYY-MM-DD: " end_date
read -p "Type your chosen CVE severity you would like displayed LOW,MEDIUM,HIGH,CRITICAL: " severity
echo -e "\n"

# Pass in the date variables to create the URL paramter string.
url_paramters="?pubStartDate=${start_date}T00:00:00:000 UTC-05:00&pubEndDate=${end_date}T00:00:00:000 UTC-05:00&resultsPerPage=2000&cvssV3Severity=${severity}"

# Displays a message to indicate data is being pulled.
echo "retrieving CVE data... please wait."

response=$(wget -q -O- "$base_url/$url_paramters")

# Parse JSON data to CSV format using JQ.
echo $response | jq -r '["ID", "Published Date", "Base Score", "Description"],
(.result.CVE_Items[] | [.cve.CVE_data_meta.ID,.publishedDate,.impact.baseMetricV3.cvssV3.baseScore,.cve.description.description_data[0].value]) | @csv' >> "${severity}_CVEsfrom${start_date}to${end_date}".csv
echo -e "\n"
echo "${severity}_CVEsfrom${start_date}to${end_date}.csv has been saved."

# Displays the number of CVE's for the specified time period with the inputted severity category. 
number_of_cves=$(cat "${severity}_CVEsfrom${start_date}to${end_date}".csv | wc -l)
result=$(($number_of_cves - 1))
echo -e "\n"
echo "There were ${result} CVEs of ${severity} severity for this time period."
echo -e "\n"

# Calculates and prints the average impact scors of the CVE's for the specified timeframe and severity. 
average_score=$(awk -F"," 'BEGIN{sum=0; counter=-1}{sum=sum+$3; counter=counter+1};END{print sum/counter}' "${severity}_CVEsfrom${start_date}to${end_date}".csv)
echo "with an average score of ${average_score} CVSS"
echo -e "\n"

while true; do

# Asks the user if they want to view the CSV file and reads either a y or n response. 
read -p "Do you want to view the CSV data now? (y/n) " yn

# Reads the input from the user and if they enter y, it loads the CSV file. If the user inputs n, then it exits the script. Any other input results in inavlid response to be displayed. 
case $yn in 
    [yY] ) echo loading CSV file...;
        break;;
    [nN] ) echo exiting...;
        exit;;
    * ) echo invalid response;;
esac

done

# Pulls the data categorised by a severity level and expports it to a CSV file. Uses the sed command to remove special characters and output is then formatted into columns. 
cat "${severity}_CVEsfrom${start_date}to${end_date}".csv | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S