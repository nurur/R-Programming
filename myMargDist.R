#library(Hmisc)
#library(lattice)
#library(ggplot2)
#attach(mtcars)



x   = seq(0, 1, by=0.001) 
y   = x
pdfX= (5.) * x**4
pdfY= (15./2.) * x**2


xtick    = seq(0, 1, by=0.1)  
tickMark = c(xtick) 


#Save plot as a pdf file 
pdf('myMargDist.pdf')


#Multiplot Option 
par(mfrow=c(2,2))

#Plot Coommands 
#Integration range 
plot(x, y, main="The Integration Space, {x,y}", 
     xlim=c(0,+1), ylim=c(0,+1), 
     xlab="x", ylab="y", 
     cex.axis=0.8, cex.main= 0.8, 
     type="l", lwd=3, col="black") 
text(0.45, 0.55, "y = x ", cex = 1.0)
axis(1, at=tickMark, cex.axis=0.8, cex.main= 0.8)
polygon(c(0,x,1), c(0,y,0), angle=45, col="green")



plot(x, pdfX, main="Marginal Probability Distribution, f_X(x)", 
     xlim=c(0,+1), ylim=c(0,5), 
     xlab="x", ylab="marginal pdf,    f_X(x)", 
     cex.axis=0.8, cex.main= 0.8, 
     pch=20, col="red", cex=0.50)
text(0.25, 4.50, "f_X(x) = 5 x^4 ", cex = 0.8)
axis(1, at=tickMark, cex.axis=0.8, cex.main= 0.8)


plot(x, pdfY, main="Marginal Probability Distribution, f_Y(y)",  
     xlim=c(0,+1), ylim=c(0,10), 
     xlab="y", ylab="marginal pdf,    f_Y(y)",
     cex.axis=0.8, cex.main= 0.8,      pch=20, col="blue", cex=0.50)
text(0.25, 9.50, "f_Y(y) = (15/2) y^2 ", cex = 0.8)
axis(1, at=tickMark, cex.axis=0.8, cex.main= 0.8)



#Detach the data set that attached before
#detach(mtcars)
#Return output to the terminal
dev.off()


#identify(x,pdfY)
#p = ggplot(mtcars, aes(x, y))
#p + geom_point() + geom_text(angle = 45)



