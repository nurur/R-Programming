require(ggplot2)

df <- data.frame(xx = c(runif(100,20,50),runif(100,40,80),runif(100,0,30)), 
                 yy = rep(letters[1:3], each = 100))

ggplot(df,aes(x=xx)) + 
    geom_histogram(data=subset(df,yy == 'a'),fill = "red", alpha = 0.2) +
    geom_histogram(data=subset(df,yy == 'b'),fill = "blue", alpha = 0.2) +
    geom_histogram(data=subset(df,yy == 'c'),fill = "green", alpha = 0.2)
