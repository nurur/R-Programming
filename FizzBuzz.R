# R script to print Fizz or Buzz or FizzBuzz
# Fizz if an integer is divided by 3
# Buzz if an integer is divided by 5
# FizBuzzz if an integer is divided by 3 or 5


n = 100
for (i in 1:n) {

    if (i %% 3 == 0 && i %% 5 == 0)
	cat(i, "  FizzBuzz", '\n')
      else if (i %% 3 == 0)     
	cat(i, "      Fizz", '\n')
      else if (i %% 5 == 0) 
	cat(i, "      Buzz", '\n')
      else    
	cat(i, "  --------", '\n')

}