#Save plot as a pdf file 
pdf('fordPrices.pdf')


#Multiplot Option 
#par(mfrow=c(2,1))


#Read the data 
a        = read.table(file="FordPrices.csv", header=TRUE, sep=",")
Prices   = a[,1]
#print(length(Prices))


#Create an observed histogram 
h = hist(Prices, nclass=30, col="blue", plot=FALSE)
#print('    ', quote=FALSE)
print('Printing Quantiles from the Obsreved data:', quote=FALSE)
print( summary(Prices) )
#print('    ', quote=FALSE)
#print(h)
#print(h$breaks)
#print(h$counts)
#print(h$mids)
area = sum((h$breaks[2]- h$breaks[1])* h$counts)
#print(area)

#Create a theroretical histogram
meanPrice = mean(Prices)
stdPrice  = sd(Prices)


print('Printing mean and the Standard Deviation')
print( c(meanPrice, stdPrice) )
format(c(meanPrice, stdPrice), digits=2)
print('    ', quote=FALSE)

x        = seq(0, 40, by=1)
density  = dnorm(x, mean=meanPrice, sd=stdPrice) 
hist(Prices, nclass=30, col="blue", lwd=3, probability=TRUE, 
     xlim=c(5.0, 35.0), ylim=c(0.0, 0.15), 
     xlab='Ford\'s Stock Prices', ylab='Normalized Density', 
     main='Histogram of Ford\'s Stock Prices',
     cex.axis=0.8, cex.main=0.8)
lines(density, type="l", col="red", lwd=3)







#p  = Prices
#p1 = p[p<10]
#p2 = p[p>=10 & p<18]
#p3 = p[p>18]

#meanPrice= mean(p1)
#stdPrice = sd(p1)
#x        = seq(0, 40, by=1)
#den1     = dnorm(x, mean=meanPrice, sd=stdPrice)

#meanPrice= mean(p2)
#stdPrice = sd(p2)
#den2     = dnorm(x, mean=meanPrice, sd=stdPrice) 

#meanPrice= mean(p3)
#stdPrice = sd(p3)
#den3     = dnorm(x, mean=meanPrice, sd=stdPrice) 


#den  = den1 + den2 + den3
#hist(p, nclass=40, col="blue", lwd=3, probability=TRUE, 
#     cex.axis=0.8, cex.main=0.8)
#lines(den, type="l", col="black", lwd=3)



#Return output to the terminal
dev.off()
