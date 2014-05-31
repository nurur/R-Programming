## Naive Bayes Classification 
## Categorical Data 


## Data Set 1
data(HouseVotes84, package = "mlbench")
model <- naiveBayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,], type = "class")
predict(model, HouseVotes84[1:10,], type = "raw")
 
pred <- predict(model, HouseVotes84)
table(pred, HouseVotes84$Class)
 
## using laplace smoothing:
model <- naiveBayes(Class ~ ., data = HouseVotes84, laplace = 3)
pred  <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)
 


 
## Data Set 2
## Example of using a contingency table:
data(Titanic, package = "datasets")
model <- naiveBayes(Survived ~ ., data = Titanic)
model
pred <- predict(model, as.data.frame(Titanic))
table(pred, (as.data.frame(Titanic))$Survived )


