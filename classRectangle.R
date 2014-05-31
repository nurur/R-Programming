setClass("rectangle",
   representation(width="numeric", height="numeric"),
   prototype(width=0, height=0),
   contains=("shape")
)

# accessors for the width & height
setGeneric("getWidth",  function(this) standardGeneric("getWidth"))
setMethod("getWidth",  "rectangle",
   function(this) {
      this@width
   }
)
setGeneric("getHeight", function(this) standardGeneric("getHeight"))
setMethod("getHeight", "rectangle",
   function(this) {
      this@height
   }
)
setGeneric("setWidth<-", function(this, value) standardGeneric("setWidth<-"))
setReplaceMethod("setWidth", "rectangle",
   function(this, value) {
      this@width <- value
      this
   }
)
setGeneric("setHeight<-", function(this, value) standardGeneric("setHeight<-"))
setReplaceMethod("setHeight", "rectangle",
   function(this, value) {
      this@height <- value
      this
   }
)

# draw the rectangle
setMethod("draw", "rectangle",
   function(this) {
      print(sprintf("Drawing a Rectangle at:(%g,%g), width %g, height %g",
         getX(this), getY(this), getWidth(this), getHeight(this)))
   }
)
