# Inline Function Implementation in R

 
# Create a character vector 
x <- c("A","A","A","B","A","B","C", "","A","B", "", "C")


# Switch elements of vector x to integer using "sapply" function 
# The argument of sapply function is an inline function    
cat( sapply(x, function(x) switch(x,  A=,  B=,  NA)), '\n')
cat( sapply(x, function(x) switch(x,  A=,  B=2, NA)), '\n')
cat( sapply(x, function(x) switch(x,  A=1, B=2, NA)), '\n')
cat( sapply(x, function(x) switch(x,  A=1, B=2, C=3, NA)), '\n')