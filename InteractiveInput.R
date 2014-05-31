# Interactive Command Line Input in R
# readline() reads the entire input as a single large string  


# Part 1
# Read String input and Print as String
s  <- readline("Enter a String         : ")  
ss <- as.character(s)
cat("You Entered a String   : ", ss, "\n")


cat("                                 \n")


# Read String input, Convert, and Print as Integer
x  <- readline("Enter an Integer Number: ")
xx <- as.numeric(x)
cat("You Entered an Integer : ", xx, "\n")


cat("                                 \n")


# Read String input, Convert, and Print as Real
y  <- readline("Enter a Real Number      : ")
yy <- as.numeric(y)
cat("You Entered a Real Number: ", yy, "\n")





# Part 2
fun <- function() 
{	 
  u <- readline("What is the value of u? ")  
  v <- readline("What is the value of v? ")
  x <- readline("What are the x values ? ")
  y <- readline("What are the y values ? ")

  u <- as.numeric(unlist(strsplit(u, ",")))
  v <- as.numeric(unlist(strsplit(v, ",")))
  x <- as.numeric(unlist(strsplit(x, ",")))
  y <- as.numeric(unlist(strsplit(y, ",")))

  a <- u + v 
  b <- x + y

  return( list(a, b) )
}

