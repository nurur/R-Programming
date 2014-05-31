#vector
#list

#factor 

#matrix & array
y = array(1:16, dim=c(4,2,2))
print(y)
#
y      <- 1:12
dim(y) <- c(2,3,2)
print(y)

y = matrix(1:16, nrow=4, ncol=2)
y = matrix(1:16, c(4,2))



#table
#The table object is a named vector
#The table( ) function is used to create frequency tables or crosstabulations 
#from raw data contained in a vector or a data frame. T
y = rnorm(100, mean=100, sd=15) 
y = round(y, 0)

ty = table(y)
names(ty)
as.vector(ty)



#dataframe 



