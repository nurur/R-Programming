setClass("circle",
   representation(radius="numeric"),
   prototype(radius=0),
   contains=("shape")
)

# accessors for the radius
setGeneric("getRadius", function(this) standardGeneric("getRadius"))
setMethod("getRadius", "circle",
   function(this) {
      this@radius
   }
)

setGeneric("setRadius<-", function(this, value) standardGeneric("setRadius<-"))
setReplaceMethod("setRadius", "circle",
   function(this, value) {
      this@radius <- value
      this
   }
)

# draw the circle
setMethod("draw", "circle",
   function(this) {
      print(sprintf("Drawing a Circle at:(%g,%g), radius %g",
         getX(this), getY(this), getRadius(this)))
   }
)
