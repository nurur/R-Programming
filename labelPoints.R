library(lattice)
X1 = c(5, -2, 1, -3)
X2 = X1^2
names = paste("dot", 1:4, sep="")


xyplot(X2~X1, data=data.frame(X1, X2), pch=20, cex=1:4,
      panel=function(x, y, ...) 
      {
      panel.xyplot(x, y, ...);
      ltext(x=x, y=y, labels=names, pos=1, offset=1, cex=0.8)
      })