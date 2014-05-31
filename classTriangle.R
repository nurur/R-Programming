setClass("triangle", representation(height="numeric", width="numeric"))

setGeneric("area", function(object) attribute(object))

setMethod("area", "triangle", 
         function(object) {
         area <- 0.5*(object@height) * object@width
         return(area)
	 })



#t <- new('triangle', height=3, width=4)
#area(t)

#t <- new('triangle')
#t@height <- 3
#t@width  <- 4
#area(t)