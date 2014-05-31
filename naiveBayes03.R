
gender = c('male','male','male','male','female','female','female','female')
height = c(6.0, 5.92, 5.58, 5.92, 5.0, 5.5, 5.42, 5.72)
weight = c(180,190,170,165,100,150,130,150)
foot   = c(12,11,8,10,6,8,7,9) 

d = data.frame(y=gender, x1=height, x2=weight, x3=foot)
model <- naiveBayes(y ~ ., data = d)
model


height= c(6.0)
weight= c(130)
foot  = c(8)
x = data.frame(x1=height, x2=weight, x3=foot)
predict(model, x, type='class')
predict(model, x, type='raw')
