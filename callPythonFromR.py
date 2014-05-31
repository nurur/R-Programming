# Python code to read tables from MySQL database
#
#Import appropriate modules
#Connect to the MySQL Server using MySQLdb module 
#Use 'mydata' database 
#Read two tables, twitterData and acsiData, from the database
#Use pandas module to merge tables using appropriate keys 
#Make scatter plot between ASCI index (x-axis) and the Twitter index (y-axis)


import MySQLdb as mdb
import pandas.io.sql as sql
from pandas import *

con  = mdb.connect('localhost','root','mysql','mydata');
df1  = sql.read_frame('select * from twitterData', con)
df2  = sql.read_frame('select * from acsiData', con)

df   = merge(df1[[1,2,3,4,5,6]], df2[[1,2,3]], on=['airline','code'], 
       left_index=True, right_index=True)



#Use matplotlib to plot the score indices of the tables 
import matplotlib.pylab as pl
pl.scatter(df.score_x, df.score_y)
pl.xlim(-1, 100)
pl.ylim(50, 100)
pl.xlabel('ACSI data', fontsize=15)
pl.ylabel('Twitter data', fontsize=15)
pl.show()
