rm(list = ls())     # clear objects  
graphics.off()      # close graphics windows   


#Binomial 
x      = seq(0, 50, by=1)
prob   = 0.0521
fd     = dbinom(x, size, prob)
Fd     = pbinom(x, size, prob)
#Compute P(45 < X < 55) for X Binomial(100,0.5)
sum( dbinom(46:54, 100, 0.5) )


#Negative Binomial 
x      = seq(0, 50, by=1)
prob   = 0.0521
fd     = dnbinom(x, size, prob)
Fd     = pnbinom(x, size, prob)


#Geometric
x      = seq(0, 50, by=1)
prob   = 0.0521
fd     = dgeom(x, prob)
Fd     = pgeom(x, prob)


#Poisson 
x      = seq(0, 50, by=1)
lambda = 35
fd     = dpois(x, lambda=lambda)
Fd     = ppois(x, lambda=lambda)


# Normal 
x      = seq(-50, 50, by=1)
m      = 0 
s      = 1.25
fd     = dnorm(x, mean=m, sd=s)
Fd     = pnorm(x, mean=m, sd=s)




plot(x, fd, type='n', 
     main='Question 5', 
     #xlim=c(10,60), ylim=c(0,+0.080), 
     xlab="", 
     ylab=expression("Density Function, f"[Poisson(35)]), 
     cex.axis=0.8, cex.main= 0.8, cex.lab = 0.8,
     cex=0.50)
xtick    = seq(10, 60, by=5)  
tickMark = c(xtick) 
axis(1, at=tickMark, cex.axis=0.8, cex.main= 0.8)

#x0 = xx[xx <= 35]
#p0 = dpois(xx[xx<=35], lambda=lambda)

