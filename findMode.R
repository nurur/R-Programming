
#Method 1
library(modeest)
mySamples <- c(19, 4, 5, 7, 29, 19, 29, 13, 25, 19)
mlv(mySamples, method = "mfv")



#Method 2
mySamples <- c(19, 4, 5, 7, 29, 19, 29, 13, 25, 19)
freq <- tapply(mySamples,mySamples,length)
tmp  <- names(freq)[which.max(freq)]
mode = as.numeric(tmp)
print(mode)



#Method 3
mySamples <- c(19, 4, 5, 7, 29, 19, 29, 13, 25, 19)
freq = table(mySamples) 
tmp  = sort(-freq) 
mode = as.numeric( names(tmp) )
print(mode)
