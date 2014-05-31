#Save plot as a pdf file 
#pdf('steelBeltTire.pdf')


#par(mfrow=c(2,1))


mean = 36500
stdev=  4000
  
#x        = seq(16500, 54500, by=500)
#densFunc = dnorm(x,mean=mean, sd=stdev)
#distFunc = pnorm(x,mean=mean, sd=stdev)



#plot(x, distFunc, main='', 
#     xlim=c(0.00, 9.00), ylim=c(0,+1), 
#     ylab=expression("F"[Normal]), 
#     xlab="Number of Miles", 
#     cex.axis=0.7, cex.main= 0.7, cex.lab=0.7, 
#     cex=0.7, pch=1, col='black', bg='red')
#lines(x, distFunc, lwd=1, type="l", col="black")
#grid()
#ytick    = seq(0, 1, by=0.1)  
#tickMark = c(ytick) 
#axis(2, at=tickMark, cex.axis=0.7, cex.main= 0.7)
#xtick    = seq(16500, 56500, by=1000)  
#tickMark = c(xtick) 
#axis(1, at=tickMark, cex.axis=0.7, cex.main= 0.7)



x        = seq(29100, 29500, by=1)
distFunc = pnorm(x,mean=mean, sd=stdev)
for (i in 1:length(x))
{
if(distFunc[i] > 0.03495 & distFunc[i] < 0.0351)
{ print( c(x[i], distFunc[i]), quote=FALSE)}
}
29252


#what percent of the tire
#print('percent of return for 30000 :')
#print( pnorm(30000,36500,4000) )

#print('percent of return for 28000 :')
#print( pnorm(28000,36500,4000) )
#print('percent of NOT return for 30000 :')
#print( pnorm(28000,36500,4000, lower=FALSE) )




x     = seq(1, 150, by=1)
Fgeom = pgeom(x, 0.0521)
plot(x, Fgeom, xlim=c(60, 150), ylim=c(0.95,1.0), 
     xlab=expression('Number of Inspections'), 
     ylab=expression('F'[Geometric]), 
     pch=1, col='black', cex=0.30)
#
grid()
#
#for (i in 1:length(x))
#{
#if(Fgeom[i] > 0.999 & Fgeom[i] < 1.0)
#{ print( c(x[i], Fgeom[i]), quote=FALSE)} 
#}
#xtick    = seq(50, 150, by=10)  
#tickMark = c(xtick) 
#axis(1, at=tickMark, cex.axis=0.7, cex.main= 0.7)






#par(new=TRUE)
N = 100
p = 0*seq(1, N, by=1)
ns= seq(1, N, by=1)
p = (ns*2.00 + (N-ns)*1.00 - N*1.40)
#plot(ns, p, pch=1, cex=0.25, xlim=c(0,100), ylim=c(0,75))
#grid()
#for (i in 1:length(p))
#{ print( c(ns[i], p[i]), quote=FALSE ) } 


N = 45
p = 0*seq(1, N, by=1)
ns= seq(1, N, by=1)
p = (ns*2.00 + (N-ns)*1.00 - N*1.40)
#plot(ns, p, pch=2, cex=0.25, xlim=c(0,100), ylim=c(0,75))


N = 50
p = 0*seq(1, N, by=1)
ns= seq(1, N, by=1)
p = (ns*2.00 + (N-ns)*1.00 - N*1.40)
#plot(ns, p, pch=3, cex=0.25, xlim=c(0,100), ylim=c(0,75))
#xtick    = seq(0, 100, by=5)  
#tickMark = c(xtick) 
#axis(1, at=tickMark, cex.axis=0.7, cex.main= 0.7)

N = 85
p = 0*seq(1, N, by=1)
ns= seq(1, N, by=1)
p = (ns*2.00 + (N-ns)*1.00 - N*1.40)
#plot(ns, p, pch=4, cex=0.50, xlim=c(0,100), ylim=c(0,75))




#Return output to the terminal
#dev.off()