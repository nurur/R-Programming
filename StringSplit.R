# Split a String in R


# Split a vector 
# strsplit takes a vector input and returns a list
x <- c("a,b,,, c ,,e,f")
strsplit(x, ",", fixed=TRUE)    #strsplit(x, "[,]")

x <- c("a.b.c")
strsplit(x, ".", fixed=TRUE)    #strsplit(x, "[.]") ##strsplit(x, "\\.")

x <- c("a\\b\\c\\d\\f")
strsplit(x, "\\", fixed=TRUE)   #strsplit(x, "[\\]")

x <- c("a     b  c  d         f")
strsplit(x, "\\s+")


# Split only the first two elements 
# Method 1 (use list)
x  <- c("a     b  c  d         f")
n  <- 2                                     #set any element element upto 3
y1 <- strsplit(x, "\\s+")[[1]][+(1:n)]
y2 <- strsplit(x, "\\s+")[[1]][-(1:n)]
c(y1, paste(y2, collapse=" "))

# Method 2 (use unlist)
y1 <- unlist(strsplit(x, "\\s+"))[+(1:n)]
y2 <- unlist(strsplit(x, "\\s+"))[-(1:n)]
c(y1, paste(y2, collapse=" "))



# Split a list on the letter 'e'
x <- c(as = "asfef", qu = "qwerty", "yeuiop[", "b", "stuff.blah.yech")
strsplit(x, "e")
# Split character by character
strsplit(x, "")

