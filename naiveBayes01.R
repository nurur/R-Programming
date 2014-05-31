## Naive Bayes Classification 
## Continuous and Categorical Data 


library(e1071)
options(digits=4)


## Data Set 1   (Data Frame)
data(iris)

# Method 1:
model <- naiveBayes(Species ~ ., data = iris)
model

# Method 2:
#model <- naiveBayes(iris[,-5], iris[,5])
#model
#
pred <-  predict(model, iris, type='raw')
table(pred, iris[,5])
#pred[pred[, 1] <= 0.0001, 1] = 0
#pred[pred[, 2] <= 0.0001, 2] = 0
#pred[pred[, 3] <= 0.0001, 3] = 0


#Classification Accuracy
ca = sum(iris[, 5] == pred)/length(iris[, 5])
#Classification Error 
ce = 1 - ca




## Data Set 2  (Contingency Table)
data(HairEyeColor)
par(mfrow=c(1,2))
## Full mosaic
mosaicplot(HairEyeColor)
## Aggregate over Gender 
x <- apply(HairEyeColor, c(1, 2), sum)
mosaicplot(x, main = "Relation between Hair and Eye Color", cex.main=0.8)

margin.table(HairEyeColor, 3)
margin.table(HairEyeColor, c(1, 3))


model <- naiveBayes(Sex ~ ., data = HairEyeColor)
model
pred  <-  predict(model, as.data.frame(HairEyecolor))



#Classification Accuracy
#ca = sum(HairEyeColor == pred)/length(HairEyeColor)
#Classification Error 
#ce = 1 - ca




## Data Set 3  (Contingency Table)
data(Titanic)
model  <- naiveBayes(Survived ~ ., data=Titanic)
predict(model, as.data.frame(Titanic))



y = c(0,0,0,0, 1,1,1,1, 2,2,2,2, 3,3,3,3)
x1= c(1.10, 1.20, 6.50, 2.75, 
      1.25, 1.55, 7.80, 2.90, 
      1.31, 1.48, 7.00, 2.81, 
      1.15, 1.33, 6.75, 2.99)

x2= c(1.20, 5.50, 3.10, 2.90, 
      1.55, 4.80, 2.75, 1.25, 
      1.75, 3.10, 4.50, 1.85, 
      0.95, 2.95, 5.50, 3.00)

d = data.frame(y=y, x1=x1, x2=x2)

model <- naiveBayes(y ~ ., data = d)
pred <-  predict(model, d, type='raw')

