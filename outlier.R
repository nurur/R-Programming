
df = read.csv('Assignment1.csv', header=TRUE, sep=',') 


# Data Frame 
#library(outliers)
#outlier_tf   = outlier(df$X1, logical=TRUE)
#find_outlier = which(outlier_tf==TRUE, arr.ind=TRUE)
#df = df[-find_outlier, ]

#outlier_tf   = outlier(df$X2, logical=TRUE)
#find_outlier = which(outlier_tf==TRUE, arr.ind=TRUE)
#df = df[-find_outlier, ]



#Box Plot 
#set.seed(100)
#x = rnorm(1000)
#x[!x %in% boxplot.stats(x)$out]