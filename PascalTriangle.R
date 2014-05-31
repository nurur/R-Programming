# Pascal's Triangle in R


# Reference:
# http://rosettacode.org/wiki/Pascal's_triangle#R
#
pascalTriangle <- function(x) {
  z=seq(0,x)
  lapply(z, function(i) choose(i, 0:i))
}



a=10

cat('From reference code :  \n')
print( pascalTriangle(a) )


cat('\n');
cat('From package \'base\': \n')
for (n in 0:a) cat(choose(n, k = 0:n), '\n')



cat('\n');
pascalTriangle2 <- function(h) {
  for(n in 0:(h)) {
    s <- ""
    for(b in 0:(h-n)) s <- paste(s, "  ", sep="")
    for(k in 0:n) {
      s <- paste(s, sprintf("%3d ", choose(n, k)), sep="")
    }
    print(s)
  }
}


cat( pascalTriangle2(a) )

