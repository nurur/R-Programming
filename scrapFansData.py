#################################################################################
#Beginning of the program   
#
import sys, csv
import urllib, urllib2
from bs4 import BeautifulSoup

<div id="content">
<div, id="contentalt1">

#################################################################################
#Part 3: Define URL and create the Soup
#Exception handling (try and except) implemented 
print '                                        '
try:
    urlAddress="http://www.industrialfansdirect.com"

    #Read the page content of the URL 
    #Use urlopen method of urllib module to read the page 
    #pageContent= urllib.urlopen(urlAddress).read()
    pageContent= urllib2.urlopen(urlAddress)

    print "URL opens successfully"
except:
    print "Error: Unable to open URL!"


#Create soup using BeautifulSoup method of bs4
print 'Creating the soup ... ... ... ... ... ... ... ....'
soup       = BeautifulSoup(pageContent)

#Use findAll method of BeautifulSoup to extract tables from the soup
print 'Extracting data from the soup ... ... ... ... ....'
table = soup.findAll('table') 


#################################################################################
#Part 4: Get Data as a long list from the table
#Rows and Cells are within the table
#For a given Row, Use findAll method to extract the Cells 
#
print 'Creating a long list containing the data ... ... .'
data = []                                        #define an empty list
for tb in table:                                 #loop over tables
    rows = tb.findAll('tr', {"align" : "center"}, {"class" : "tableRow2Font"})
    for tr in rows:
        cells = tr.findAll('td')
        for td in cells:              #discard cell numbers from the back 
            data.append( str(td.getText()) )     #append each cell to the data list
 
#Part 4 ends



#################################################################################
#Part 5: Transfer Data from list to a 2D Table
#Create a 2d array with 8 Cells and relevant number of cells given by rNum  
rNum   = int(len(data)/cNum)
array2D= [ cNum*[0] for x in range(rNum)]

#Transfer Data list to the Table array 
k=0
for d1 in range(rNum):
    for d2 in range(cNum):
        array2D[d1][d2]= data[k]
        k = k + 1

print 'Cleaned data saved in the 2d array ... ... ... ...'
#Part 5 ends



#################################################################################
#Part 6: Save Table in a csv file
print 'Writing data from the 2D array to the csv file ...' 
outfile   = open('problem.1a.csv', 'w')
writerObj = csv.writer(outfile, dialect='excel')

for row in array2D:
    writerObj.writerow(row)

outfile.close()
#Part 6 ends


#End of the program
