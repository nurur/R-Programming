
setClass("polygon", slots = c(x="numeric", y="numeric"))
         prototype = prototype(x=numeric(4), y=numeric(4))


setMethod("plot", "polygon",
    function(x, y, ...) {
        
        plot(x@x, x@y, type = "p", ...)

        xp <- c(x@x, x@x[1])
        yp <- c(x@y, x@y[1])
        lines(xp, yp)
    })


#Define Class (Method 1)
p <- new('polygon', x=c(1,2,3,4), y=c(1,2,3,1))
plot(p, xlab='X', ylab='Y')


#Define Class (Method 2)
#p   <- new('polygon')
#p@x <- c(1,2,3,4)
#p@y <- c(1,2,3,1))
#plot(p)