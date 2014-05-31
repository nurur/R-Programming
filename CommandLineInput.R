# Command Line Input in R
 
# To run the script, type: Rscript CommandLineInput.R 2 3.1415


argv <- commandArgs(TRUE)
x   <- as.numeric(argv[1])
y   <- as.numeric(argv[2])

cat("x =", x, "\n")
cat("y =", y, "\n")
cat("\n")

cat("x + y = ", x + y, "\n")
cat("x - y = ", x - y, "\n")
cat("x * y = ", x * y, "\n")
cat("x / y = ", x / y, "\n")

format(c(x, y))
print( c(x, y) )
#show( c(x, y) )
#write( c(x, y))