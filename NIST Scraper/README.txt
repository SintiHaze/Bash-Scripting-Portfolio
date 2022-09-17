NIST Scraper - README file

Author: Jacinta Hayward
Last date modified: 21/08/2022

HOW TO INSTALL:
- Firstly, you will need to install jq package. 
- You can do this by entering the following command through the command line using the following: sudo apt install jq

HOW TO RUN THE PROJECT:
- Download all the files from the repository (or folder). This should include: nistScraper.sh, secret.txt and this README file. 
- Once this is done, direct the command line to ./nistScraper.sh and add the start date and end date that you would like to view the data for. Please format it as YYYY-MM-DD for the date. 
- You will then need to enter the severity category of CVE's that you would like to view for that timeframe. You can choose from one of the following: LOW, MEDIUM, HIGH, CRITICAL.
- An example of the command to execute the script would be: ./nistScraper.sh  2022-01-22 2022-02-22 CRITICAL
- Once the script has pulled and displayed the CVE details, type q to exit the displayed information. 

INTENDED USE:
- This script is intended for educational purposes and accesses a publically available API (NIST CVE Vulnerability Index).   
