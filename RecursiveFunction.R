# Recursive function implementation in  R



# Power function 
powFunc <- function(base, power){
    	if (base < 0)
    	{
	  cat('Error! negative base for power!','\n')
    	  soptifnot(base < 0) 
    	}		    

    	if (power == 0) return (1)
    	return ( powFunc(base, power-1) * base) #if (power > 0)
}

# Factorial function 
factFunc <-  function(n){ 
    	 if (n < 0)
         {    
	   cat('Error! negative argument for factorial!', '\n')
           sopifnot(1);
 	  }
 
	if (n == 0 || n == 1) return (1) 
        return (n*factFunc( n-1 ))   #if (n > 1)
}



# Power function 
m=3
d= seq(0, 9, by=1)
cat('Recursive Func. with Return Value: Power Function    ','\n')
for (i in d){
        cat(m, 'to the power ',i ,'', powFunc(m,i), '\n')
}
cat('            \n')


# Factorial fucntion 
n=4
cat('Recursive Func. with Return Value: Factorial Function','\n')
cat('Factorial of', n, 'is:', factFunc(n), '\n')   
cat('          \n')


# Inbuilt factorial function
cat('Using R inbuilt factorial function :', '\n')
cat('Factorial of', n, 'is:', factorial(n), '\n')   
cat('          \n')
