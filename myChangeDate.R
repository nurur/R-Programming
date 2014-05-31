
d = read.csv("L_CUSTOMER.csv", header=TRUE, sep=',')  # read csv file 
a  = as.Date(d$ACQUISITION_DATE, format='%m/%d/%Y')

#Empty List
b <- {}
for (i in 1:length(a)) 
{ 
b[i] = paste(a[i], '00:00:00', sep=' ') 
}

d$ACQUISITION_DATE = b
#Remove Column LOST_DATE
d2 = d[-c(15)]   #d2 = subset(d2, select=-c(15))
write.csv(d2, 'L_CUSTOMER_FIXD.csv', row.names=FALSE)


#Remove column LOST_DATE
#c  = as.Date(d1$LOST_DATE, format='%m/%d/%y')
#d <- rep('0000-00-00 00:00:00', length(c))
#for (i in 1:length(c)) 
#{ d[i] = paste(c[i], '00:00:00', sep=' ') }

#d1$LOST_DATE = d
#write.csv(d, 'L_CUSTOMER_FIXD.csv', row.names=FALSE)





d1 = read.csv("L_CAL_DATE.csv", header=TRUE, sep=',')  # read csv file 
a  = as.Date(d1$DATE_ID, format='%m/%d/%y')

#Empty List
b <- {}
for (i in 1:length(a)) 
{ 
b[i] = paste(a[i], '00:00:00', sep=' ') 
}

d1$DATE_ID = b
write.csv(d1, 'L_CAL_DATE_FIXD.csv', row.names=FALSE)




d1 = read.csv("F_CUST_TXN_HIST.csv", header=TRUE, sep=',')  # read csv file 
a  = as.Date(d1$DATE_ID, format='%m/%d/%y')
#Empty List
b <- {}
for (i in 1:length(a)) 
{ b[i] = paste(a[i], '00:00:00', sep=' ') 
}

d1$DATE_ID = b
write.csv(d1, 'F_CUST_TXN_HIST_FIXD.csv', row.names=FALSE)

