
import pandas.io.data as web
import datetime as dt
import numpy as np
from pandas import Series, DataFrame, Panel
import matplotlib as mpl
import matplotlib.pyplot as plt
import pylab as pl


start = dt.datetime(2013,10,01)
end   = dt.datetime(2013,10,17)

goo = web.DataReader("GOOG", "yahoo", start, end)
yah = web.DataReader("YHOO", "yahoo", start, end)
gms = web.DataReader("GS",   "yahoo", start, end)
mgs = web.DataReader("MS",   "yahoo", start, end)
ibm = web.DataReader("IBM",  "yahoo", start, end)


plt.figure(1)
plt.subplot(121)
plt.plot(goo.index, goo.Close)
plt.title('Google Stock Price for 2013', fontsize=10)
plt.xlabel('Days', fontsize=6, color='red')
plt.ylabel('Closing Price', fontsize=6, color='red')
pl.tick_params(axis='y', which='major', labelsize=10)
pl.tick_params(axis='x', which='major', labelsize=10)
import matplotlib.figure.Figure as fig
fig.autofmt_xdate()


plt.subplot(122)
plt.plot(yah.index, yah["Close"], 'k.')
plt.title('Yahoo Stock Price for 2013', fontsize=10)
plt.xlabel('Days', fontsize=10, color='red')
plt.ylabel('Closing Price', fontsize=10, color='red')
pl.tick_params(axis='y', which='major', labelsize=8)
pl.tick_params(axis='x', which='major', labelsize=8)


plt.figure(2)
plt.subplot(121)
plt.plot(gms.index, gms["Close"], 'k.')
plt.title('Goldman Sachs Stock Price for 2013', fontsize=10)
plt.xlabel('Days', fontsize=10, color='red')
plt.ylabel('Closing Price', fontsize=10, color='red')
pl.tick_params(axis='y', which='major', labelsize=8)
pl.tick_params(axis='x', which='major', labelsize=8)


plt.subplot(122)
plt.plot(mgs.index, mgs["Close"], 'k.')
plt.title('Morgan Stanley Stock Price for 2013', fontsize=10)
plt.xlabel('Days', fontsize=10, color='red')
plt.ylabel('Closing Price', fontsize=10, color='red')
pl.tick_params(axis='y', which='major', labelsize=8)
pl.tick_params(axis='x', which='major', labelsize=8)


plt.figure(3)
plt.subplot(121)
plt.plot(ibm.index, ibm["Close"], 'k.')
plt.title('IBM Stock Price for 2013', fontsize=10)
plt.xlabel('Days', fontsize=10, color='red')
plt.ylabel('Closing Price', fontsize=10, color='red')
pl.tick_params(axis='y', which='major', labelsize=8)
pl.tick_params(axis='x', which='major', labelsize=8)


plt.figure(4)
plt.plot(goo.index, goo["Close"], 'b.', 
         yah.index, yah["Close"], 'g.', 
         gms.index, gms["Close"], 'r.', 
         mgs.index, mgs["Close"], 'c.', 
         ibm.index, ibm["Close"], 'y.')

plt.draw()
plt.show()




#bottom = plt.subplot2grid((4,4), (3,0), rowspan=1, colspan=4)
#bottom.bar(google.index, google['Volume'])
#plt.title('Google Trading Volume in Millions')

#plt.gcf().set_size_inches(15,8)




#import matplotlib.pyplot as plt
#top = plt.subplot2grid((4,4), (0, 0), rowspan=3, colspan=4)
#top.plot(goo.index, goo["Close"])
#plt.title('Google Stock Price for 2013')

#bottom = plt.subplot2grid((4,4), (3,0), rowspan=1, colspan=4)
#bottom.bar(google.index, google['Volume'])
#plt.title('Google Trading Volume in Millions')

#plt.gcf().set_size_inches(15,8)
#plt.show()


#close_pix.plt()


#from numpy import corrcoef, sum, log, arange
#from numpy.random import rand
#from pylab import pcolor, show, colorbar, xticks, yticks

# generating some uncorrelated data
#data = rand(10,100) # each row of represents a variable

# creating correlation between the variables
# variable 2 is correlated with all the other variables
#data[2,:] = sum(data,0)
# variable 4 is correlated with variable 8
#data[4,:] = log(data[8,:])*0.5

# plotting the correlation matrix
#R = corrcoef(data)
#pcolor(R)
#colorbar()
#yticks(arange(0.5,10.5),range(0,10))
#xticks(arange(0.5,10.5),range(0,10))
#plt.show()
