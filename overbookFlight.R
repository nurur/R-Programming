#Save plot as a pdf file 
pdf('overbookFlight.pdf')


par(mfrow=c(2,2))


m       = 201
tIssued = 206
n = seq(tIssued, 230, by=1)

probSeq01  = 0*seq(1, length(n), by=1)

for (i in 1:length(n))
{
x = seq(m, n[i], by=1)
p = 0.95
q = (1. - p)

prob = 0.
for (j in 1:length(x))
{  
prob = prob + choose(n[i], x[j]) * p**x[j]  * q**(n[i] - x[j]) 
}
probSeq01[i] = prob  
print( c(j, prob) )
}

plot(n, probSeq01, main='Question 3a : Part i', 
     xlim=c(205,230), ylim=c(0,+1), 
     xlab="Seat Issued", ylab="P(> 200 pass. will show up)", 
     cex.axis=0.8, cex.main= 0.8, cex.lab = 0.9,
     cex=0.75)
lines(n, probSeq01, lwd=1, type="l", col="black")
#text(0.45, 0.55, "y = x ", cex = 1.0)
ytick    = seq(0, 1, by=0.1)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.8, cex.main= 0.8)



print('                        ', quote=FALSE)




m = 206
tIssued = 206
n = seq(tIssued, 230, by=1)

probSeq02  = 0*seq(1, length(n), by=1)

for (i in 1:length(n))
{
x = seq(m, n[i], by=1)
p = 0.95
q = (1. - 0.95)

prob = 0.
for (j in 1:length(x))
{  
prob = prob + choose(n[i], x[j]) * p**x[j]  * q**(n[i] - x[j]) 
}
probSeq02[i] = prob  
}

plot(n, probSeq02, main='Question 3a: Part ii', 
     xlim=c(205,230), ylim=c(0,+1), 
     xlab="Seat Issued", ylab="P(> 205 pass. will show up)", 
     cex.axis=0.8, cex.main= 0.8, cex.lab=0.9, 
     cex=0.75)
lines(n, probSeq02, lwd=1, type="l", col="black")
#text(0.45, 0.55, "y = x ", cex = 1.0)
ytick    = seq(0, 1, by=0.1)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.8, cex.main= 0.8)




m = 195
n = seq(tIssued, 230, by=1)

probSeq03  = 0*seq(1, length(n), by=1)

for (i in 1:length(n))
{
x = seq(m, n[i], by=1)
p = 0.95
q = (1. - 0.95)

prob = 0.
for (j in 1:length(x))
{  
prob = prob + choose(n[i], x[j]) * p**x[j]  * q**(n[i] - x[j]) 
}
probSeq03[i] = prob  
}


plot(n, probSeq03, main='Question 3a: Part iii', 
     xlim=c(205,220), ylim=c(0.60, 1.00), 
     xlab="Seat Issued", ylab="P(at least 195 seats filled)", 
     cex.axis=0.8, cex.main= 0.8, cex.lab=0.9, 
     cex=0.75)
lines(n, probSeq03, lwd=1, type="l", col="black")
ytick    = seq(0.60, 1, by=0.1)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.8, cex.main= 0.8)




m = 190
n = seq(tIssued, 230, by=1)

probSeq04  = 0*seq(1, length(n), by=1)

for (i in 1:length(n))
{
x = seq(m, n[i], by=1)
p = 0.95
q = (1. - 0.95)

prob = 0.
for (j in 1:length(x))
{  
prob = prob + choose(n[i], x[j]) * p**x[j]  * q**(n[i] - x[j]) 
}
probSeq04[i] = prob  
}

plot(n, probSeq04, main='Question 3a: Part iv', 
     xlim=c(205,220), ylim=c(0.96,1.00), 
     xlab="Seat Issued", ylab="P(at least 190 seats filled)", 
     cex.axis=0.8, cex.main= 0.8, cex.lab=0.9, 
     cex=0.75)
lines(n, probSeq04, lwd=1, type="l", col="black")
ytick    = seq(0.96, 1, by=0.01)  
tickMark = c(ytick) 
axis(2, at=tickMark, cex.axis=0.8, cex.main= 0.8)



for (i in 1:length(n))
{ print( c(n[i], probSeq01[i], probSeq02[i], probSeq03[i], probSeq04[i])) }



#Return output to the terminal
dev.off()
