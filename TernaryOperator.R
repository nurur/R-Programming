# Ternary Operator in R


# x is TRUE
x=1; y=2; z=4;     #x=TRUE; y=2; z=4
cat("x, y, z values are : ", x, y, z, '\n')


m = ifelse(x,y,z)
print(m)
cat('Ternary operator result: ', m, '\n')
#print( paste('Ternary operator result: ', m), quote=FALSE)


cat('                                \n')


# x is FALSE
x=0; y=2; z=4;     #x=FALSE; y=2; z=4
n = ifelse(x,y,z)
cat('Ternary operator result: ', n, '\n')
#print( paste('Ternary operator result: ', n), quote=FALSE)