
library(rpart)

library(mlbench)
data(Sonar)
#data(Sonar, package = "mlbench")


dim   = length(as.numeric(row.names(Sonar)))
train = Sonar[1:150, ]
test  = Sonar[51:dim, ]


minSplit = 4


################## FIXED SUBSET ################
print('     ')
print('Fixed Subset ... ... ')

## TRAINING DATA
y_train = as.factor(train[,61])
x_train = train[,1:60]
model  <- rpart(y_train ~ ., data = x_train, method = 'class',
                   control = rpart.control(minsplit = minSplit, 
		   	     		   minbucket = round(minSplit/2), 
                                           cp = 0.01, 
                                           maxcompete  = 4, 
					   maxsurrogate= 5, 
					   usesurrogate= 2, 
					   xval = 10, 
					   surrogatestyle = 0, 
					   maxdepth = 20))

pred   <- predict(model, x_train, type='class')


#Classification Accuracy of the Training Data
ca = sum(y_train == pred)/length(y_train)
options(digits=4)
cat('Classification Accuracy:', ca, '\n')

#Classification Error of the Training Data 
ce = 1 - ca
options(digits=4)
cat('Classification Error  :', ce, '\n')

cat(' \n')


#### TEST DATA
y_test = as.factor(test[, 61])
x_test = test[, 1:60]

pred   <- predict(model, x_test, type='class')

#Classification Accuracy of the Test Data
ca = sum(y_test == pred)/length(y_test)
options(digits=4)
cat('Classification Accuracy:', ca, '\n')

#Classification Error of the Test Data 
ce = 1 - ca
options(digits=4)
cat('Classification Error   :', ce, '\n')





################## RANDOM SUBSET ################
print('     ', quote=F)
print('Random Subset ... ... ')
# Create a subSet of Training (Sampling 75%) 

## TRAINING DATA
n = as.integer(0.75 * dim)
train = Sonar[sample(1:nrow(Sonar), n, replace=F), ]
sr    = rownames(train)
dr    = rownames(Sonar)

## TEST DATA
# Set - subSet (Remaining 25%)
test = Sonar[!(dr %in% sr), ]


# Train
y_train = as.factor(train[,61])
x_train = train[,1:60]
model  <- rpart(y_train ~ ., data = x_train)

pred   <- predict(model, x_train, type='class')


# Test
y_test = as.factor(test[, 61])
x_test = test[, 1:60]

pred   <- predict(model, x_test, type='class')

#Classification Accuracy of the Test Data
ca = sum(y_test == pred)/length(y_test)
options(digits=4)
cat('Classification Accuracy:', ca, '\n')

#Classification Error of the Test Data 
ce = 1 - ca
options(digits=4)
cat('Classification Error  :', ce, '\n')
