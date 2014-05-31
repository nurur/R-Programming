#Save plot as a pdf file 
pdf('factoryInspect.pdf')



x = 48
p = seq(0.01, 0.1, by=0.005)
y = 0*seq(1, length(p), by=1)

for (i in 1:length(p))
{
 y[i] = dgeom(x,p[i]) 
 print( c(p[i], y[i]) )
}

plot(p, y, main='p vs. Probability', 
     xlim=c(0.01, 0.105), ylim=c(0.0001, 0.02), 
     ylab="P(> one day for an inspection to be 'out of control')", 
     xlab="p (out of control)", 
     cex.axis=0.8, cex.main= 0.8, cex.lab=0.8, 
     cex=0.7, pch=1, col='black', bg='red')
lines(p, y, lwd=1, type="l", col="black")
text(p, y, signif(y, digits=2), cex=0.55, pos=4, col="blue") 
grid()






#Return output to the terminal
dev.off()