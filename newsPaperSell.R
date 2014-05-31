rm(list = ls())     # clear objects  
graphics.off()      # close graphics windows   


#Save plot as a pdf file 
pdf('newsPaperSell.pdf')


par(mfrow=c(2,1))


x      = seq(0, 75, by=1)
lambda = 35

p  = ppois(x, lambda=lambda)

#plot(x, ppois(x, lambda=lambda), xlim=c(0,75), ylim=c(0,1.0))

plot(x, ppois(x, lambda=lambda), 
     main='Question 5', 
     xlim=c(0,75), ylim=c(0,+1), 
     xlab="Number of Newspaper Sell", 
     ylab=expression("Distribution Function, F"[Poisson(35)]), 
     cex.axis=0.8, cex.main= 0.8, cex.lab = 0.8,
     cex=0.50)
lines(x, ppois(x, lambda=lambda), lwd=1, type="l", col="black")
xtick    = seq(0, 75, by=5)  
tickMark = c(xtick) 
axis(1, at=tickMark, cex.axis=0.8, cex.main= 0.8)
ytick    = seq(0, 1, by=0.1)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.8, cex.main= 0.8)

x0 = x[x > 34 & x < 36]
p0 = ppois(x[x>34 & x<36], lambda=lambda)
text(x0, p0, signif(p0, digits=2), cex=0.55, pos=4, col="red") 
x0 = x[x > 39 & x < 41]
p0 = ppois(x[x>39 & x<41], lambda=lambda)
text(x0, p0, signif(p0, digits=2), cex=0.55, pos=4, col="red") 
grid()


#lines(x[x>70 & x<72], p[p>0.99 & p==1])
segments(71,0, 71, 1.)


#x <- runif(12); y <- rnorm(12)
#i <- order(x,y); x <- x[i]; y <- y[i]
#plot(x, y, main="arrows(.) and segments(.)")
## draw arrows from point to point :
#s <- seq(length(x)-1)# one shorter than data
#arrows(x[s], y[s], x[s+1], y[s+1], col= 1:3)
##draw lines
#s <- s[-length(s)]
#segments(x[s], y[s], x[s+2], y[s+2], col= 'pink')





xx = seq(10, 60, by=1)
dd = dpois(xx, lambda=lambda)
 
plot(xx, dd, type='n', 
     main='Question 5', 
     xlim=c(10,60), ylim=c(0,+0.080), 
     xlab="Number of Newspaper Sell", 
     ylab=expression("Density Function, f"[Poisson(35)]), 
     cex.axis=0.8, cex.main= 0.8, cex.lab = 0.8,
     cex=0.50)
xtick    = seq(10, 60, by=5)  
tickMark = c(xtick) 
axis(1, at=tickMark, cex.axis=0.8, cex.main= 0.8)

#x0 = xx[xx <= 35]
#p0 = dpois(xx[xx<=35], lambda=lambda)
#text(x0, p0, signif(p0, digits=2), srt=-45, cex=0.60, pos=2, col="red") 
#x0 = xx[xx >= 35]
#p0 = dpois(xx[xx>=35], lambda=lambda)
#text(x0, p0, signif(p0, digits=2), srt=+45, cex=0.60, pos=4, col="red") 

#x0 = xx[xx == 35]
#p0 = dpois(xx[xx==35], lambda=lambda)
#text(x0, p0, signif(p0, digits=2), srt=+90, cex=0.60, pos=4, col="red") 

#text(xx, dd, signif(dd, digits=4), srt=+90, cex=0.60, pos=4, col="red") 

text(xx, dd, signif(dd, digits=3), srt=90, cex=0.50, col="red") 



#Return output to the terminal
dev.off()