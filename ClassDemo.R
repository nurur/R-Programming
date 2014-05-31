# A Simple Class implementation in C++
# A Ratio Class


# Ratio Class
# Default Constructor
# Constructor
setClass("Ratio", slots = c(num="numeric", den="numeric"),
                  prototype = prototype(num=0, den=1))


#Constructor 
Ratio <- function(...) new('Ratio', ...)


# Class Method : printRatio
setGeneric("printRatio", function(object) attribute(object))

setMethod("printRatio", "Ratio",
    function(object) {
        
        printRatio <- (paste(object@num, '/', object@den, sep=''))
        return (printRatio)
    })


# Class Method: CalcRatio
setGeneric("calcRatio", function(object) attribute(object))

setMethod("calcRatio", "Ratio",
    function(object) {
        
        calcRatio <- object@num/object@den
        return (calcRatio)
    })




# Define an Instance of Ratio Class Using Default Values
x = new('Ratio')
# Print
print( paste('x = ', printRatio(x)), quote=FALSE)
cat('                       \n')



# Define an Instance of Ratio Class Using User Defined New Values
y = new('Ratio', num=22, den=7)

# Print
print( paste('y = ', printRatio(y)), quote=FALSE)
print( paste('y.calcRatio() = ', calcRatio(y)), quote=FALSE)
cat('                       \n')


# Copy Ratio Class from x to Class z
z = y
# Print
print( paste('z = ', printRatio(z)), quote=FALSE)
print( paste('z.calcRatio() = ', calcRatio(z)), quote=FALSE)

