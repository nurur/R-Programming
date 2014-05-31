tryMe <- function() {
   # set up some shape instances
   scribble <- list(new("rectangle", x=10, y=20, width=5, height=6),
                    new("circle", x=15, y=25, radius=8))

   # iterate through the array and handle shapes polymorphically
   for (each in scribble) {
      draw(each)
      rMoveTo(each) <- c(100, 100)
      draw(each)
   }

   # access a rectangle specific function
   arect <- new("rectangle", x=0, y=0, width=15, height=15)
   setWidth(arect) <- 30
   draw(arect)
}


tryMe()

