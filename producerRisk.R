#Save plot as a pdf file 
pdf('producerRisk.pdf')

par(mfrow=c(1,2))


d = seq(0.01, 0.08, by=0.005)
y = 0*seq(1, length(d), by=1)
y2= 0*seq(1, length(d), by=1)

for (i in 1:length(d))
{
 y[i] = dbinom(0,15,d[i]) 
 y2[i]= 1 - y[i]
 print( c(d[i], y[i], y2[i]) )
}

d = 100 * d
plot(d, y, main='Percent of Defectives vs. Consumer\'s Risk', 
     xlim=c(0.00, 9.00), ylim=c(0,+1), 
     ylab="Consumer\'s Risk  (prob of accepting a bad lot)", 
     xlab="Percent of Defectives", 
     cex.axis=0.7, cex.main= 0.7, cex.lab=0.7, 
     cex=0.7, pch=1, col='black', bg='red')
lines(d, y, lwd=1, type="l", col="black")
text(d, y, signif(y, digits=2), cex=0.55, pos=4, col="blue") 
grid()
ytick    = seq(0, 1, by=0.1)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.7, cex.main= 0.7)
xtick    = seq(0.00, 9.0, by=1)  
tickMark = c(xtick) 
axis(1, at=tickMark, cex.axis=0.7, cex.main= 0.7)



plot(d, y2, main='Percent of Defectives vs. Producer\'s Risk', 
     xlim=c(0.00, 9.00), ylim=c(0,+1), 
     ylab="Producer\'s Risk (prob of rejecting a good lot)", 
     xlab="Percent of Defectives", 
     cex.axis=0.7, cex.main= 0.7, cex.lab=0.7, 
     cex=0.7, pch=1, col='red', bg='red')
lines(d, y2, lwd=1, type="l", col="black")
text(d, y2, signif(y2, digits=2), cex=0.55, pos=4, col="blue") 
grid()
ytick    = seq(0, 1, by=0.1)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.7, cex.main= 0.7)
xtick    = seq(0.00, 9.0, by=1)  
tickMark = c(xtick) 
axis(1, at=tickMark, cex.axis=0.7, cex.main= 0.7)



#Return output to the terminal
dev.off()