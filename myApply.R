#base::apply             Apply Functions over Array Margins
#base::by                Apply a Function to a Data Frame Split by Factors
#base::eapply            Apply a Function over Values in an Environment
#base::lapply            Apply a Function over a List or Vector
#base::mapply            Apply a Function to Multiple List or Vector Arguments
#base::rapply            Recursively Apply a Function to a List
#base::sapply            Apply a Function over a List or Vector
#base::tapply            Apply a Function over a Ragged Array



#Part 1 (Data Frame)
N <- 10
x1 <- rnorm(N)
x2 <- rnorm(N) + x1 + 1
male <- rbinom(N,1,0.48)
y <- 1 + x1 + x2 + male + rnorm(N)


df <- data.frame(y,x1,x2,male)  # data frame 


apply(df,1,mean)                # applies function to each row
apply(df,2,mean)                # applies function to each column


lapply(df, mean)                # returns a list

sapply(df, mean)                # returns a vector

tapply(df$x1,df$x2,mean)        # applies function to each level of the factor
tapply(df$y,df$male,mean)       # applies function to each level of the factor







#Part 2 (Matrix)
# apply
# create a matrix of 10 rows x 2 columns
m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)

# mean of the rows
apply(m, 1, mean)
# mean of the columns
apply(m, 2, mean)
# divide all values by 2
apply(m, 1:2, function(x) x/2)


# quantiles 
m <- matrix(rnorm(200), 20, 10)
apply(m, 1, quantile, probs = c(0.25, 0.75))




# eapply
e <- new.env()
# two environment variables, a and b
e$a <- 1:10
e$b <- 11:20
# mean of the variables
eapply(e, mean)



# lapply
# create a list with 2 elements
l <- list(a = 1:10, b = 11:20)
# the mean of the values in each element
lapply(l, mean)
# the sum of the values in each element
lapply(l, sum)



# mapply
# create two lists with 2 elements each 
l1 <- list(a = c(1:10),  b = c(11:20))
l2 <- list(c = c(21:30), d = c(31:40))
# sum the corresponding elements of l1 and l2
mapply(sum, l1$a, l1$b, l2$c, l2$d)



# rapply
# create a list with 2 elements
l <- list(a = 1:10, b = 11:20)
# log2 of each value in the list
rapply(l, log2)
# log2 of each value in each list
rapply(l, log2, how = "list")



# sapply
# create a list with 2 elements
l <- list(a = 1:10, b = 11:20)
# mean of values using sapply
sapply(l, mean)



# tapply
# use a vector 
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
tapply(x, f, mean)

# use a data frame 
attach(iris)
# mean petal length by species
tapply(iris$Petal.Length, Species, mean)
detach(iris)




# vapply
# create a list with 2 elements
l <- list(a = 1:10, b = 11:20)
# fivenum of values using vapply
l.fivenum <- vapply(l, fivenum, c(Min.=0, "1st Qu."=0, Median=0, "3rd Qu."=0, Max.=0))
class(l.fivenum)
l.fivenum