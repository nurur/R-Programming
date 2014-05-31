# Generating Fibonacci numbers in R
# Algorithm : F_n = F_(n-1) + F_(n-2)


fibonacciNumber <- function(n){
		f0 <- 0; f1 <- 1;
		cat('Fibonacci numbers ', bound, ':\n0, 1')
		while(TRUE) {
		f2 <- f0 + f1;		
		if (f2 > bound) { cat('\n'); return() }
		#stopifnot(f2 < bound)
		cat(', ', f2) 
		f0 <- f1; f1 <- f2;
		}
}



# Read the input 
inp   <- readline("Enter a positive number: ")
bound <- as.numeric(inp)


# Generate Fibonacci Number Method 1
f0 <- 0; f1 <- 1;
cat('Fibonacci numbers ', bound, ':\n0, 1')
f2 <- f0 + f1;	
while(f2 < bound){
cat(', ', f2) 
f0 <- f1; f1 <- f2;
f2 <- f0 + f1;		
}
cat(' \n')



# Generate Fibonacci Number Method 2
fibonacciNumber(bound)


