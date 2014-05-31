setClass("shape",
   representation(x="numeric", y="numeric"),
   prototype(x=0, y=0)
)

# accessors for x & y
setGeneric("getX", function(this) standardGeneric("getX"))
setMethod("getX", "shape",
   function(this) {
      this@x
   }
)
setGeneric("getY", function(this) standardGeneric("getY"))
setMethod("getY", "shape",
   function(this) {
      this@y
   }
)
setGeneric("setX<-", function(this, value) standardGeneric("setX<-"))
setReplaceMethod("setX", "shape",
   function(this, value) {
      this@x <- value
      this
   }
)
setGeneric("setY<-", function(this, value) standardGeneric("setY<-"))
setReplaceMethod("setY", "shape",
   function(this, value) {
      this@y <- value
      this
   }
)

# move the x & y position of the object
setGeneric("moveTo<-", function(this, value) standardGeneric("moveTo<-"))
setReplaceMethod("moveTo", "shape",
   function(this, value) {
      setX(this) <- value[1]
      setY(this) <- value[2]
      this
   }
)
setGeneric("rMoveTo<-", function(this, value) standardGeneric("rMoveTo<-"))
setReplaceMethod("rMoveTo", "shape",
   function(this, value) {
      moveTo(this) <- value + c(getX(this), getY(this))
      this
   }
)

# virtual draw method
setGeneric("draw", function(this) standardGeneric("draw"))