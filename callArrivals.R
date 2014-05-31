#Save plot as a pdf file 
pdf('callArrivals.pdf')

#Multiplot Option 
par(mfrow=c(2,1))


#Read the data 
a        = read.table(file="CallArrivals.csv", header=TRUE, sep=",")
Arrivals = a[,1]
#print(length(Arrivals))


#Create an observed histogram 
h = hist(Arrivals, nclass=50, col="blue", plot=FALSE)
#print('    ', quote=FALSE)
print('Printing Quantiles from the Obsreved data:', quote=FALSE)
print( summary(Arrivals) )
#print('    ', quote=FALSE)
#print(h)
#print(h$breaks)
#print(h$counts)
#print(h$mids)
area = sum((h$breaks[2]- h$breaks[1])* h$counts)
#print(area)

#Create a theroretical histogram
meanArrival = mean(Arrivals)
stdArrival = sd(Arrivals)
rate       = 1/meanArrival
sdRate     = rate * (stdArrival/meanArrival)


print('Printing Rate and its Standard Deviation')
print( c(rate, sdRate) )
print('    ', quote=FALSE)

x       = seq(1, 5527, by=1)
Density = dexp(x, rate) 
hist(Arrivals, nclass=50, col="blue", lwd=3, probability=TRUE, 
     xlab='Observed call Arrivals', 
     main='Histogram of Observed call Arrivals',
     cex.axis=0.8, cex.main=0.8)
#hist(Arrivals, nclass=50, col="blue", lwd=3)
lines(Density, type="l", col="red", lwd=3)
#print('Printing Quantiles from the Exopental Model:', quote=FALSE)
#print( summary(Density) )
#print(Density)


#hist(Arrivals, nclass=50, col="blue", lwd=3)
#print('Printing Quantiles from the Exopental Model:', quote=FALSE)
#distFunc = pexp(x, rate) 
#print( summary(xx) )
#plot(distFunc, xlab='x', ylab='F(x)', type="l", col="red", lwd=3)
#lines(distFunc, type="l", col="red", lwd=3)



#Simulation
simDim = 100
q25 = 0*seq(1, length(simDim), len=length(simDim))
q50 = 0*seq(1, length(simDim), len=length(simDim))
q75 = 0*seq(1, length(simDim), len=length(simDim))

for (k in 1:simDim)
{
unifNum = runif(50*length(Arrivals))
xx      = seq(1, 50*length(Arrivals), len=50*length(Arrivals))
for (i in 1:length(xx))
{ 
xx[i]   = -log(1 - unifNum[i])/rate
}
q25[k] = (quantile(xx, names=FALSE)[2])
q50[k] = (quantile(xx, names=FALSE)[3])
q75[k] = (quantile(xx, names=FALSE)[4])
}

print( c(mean(q25), sd(q25), mean(q50), sd(q50), mean(q75), sd(q75) ) )
format( c(mean(q25), sd(q25), mean(q50), sd(q50), mean(q75), sd(q75) ), digit=2)
#cat( sprintf("\"%f\" \"%f\"\n", mean(q25), sd(q25)) )


hist(xx, nclass=50, col="red", lwd=3, probability=TRUE,
     xlab='Simulated call Arrivals', 
     main='Histogram of Simulated call Arrivals',
     cex=0.8, cex.axis=0.8, cex.main=0.8)
#lines(xx, col="red", lwd=3)


#Return output to the terminal
dev.off()
