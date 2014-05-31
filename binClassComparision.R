
#### Part 1
#### Load Packages
library(e1071)
library(rpart)
library(tree)
library(nnet)
library(randomForest)
library(party)
library(arm)
library(aod)
library(gmodels)
library(ROCR)




#### Part 2
#### Load Data 
df = read.csv('data_titanic3.csv', header=TRUE, sep=',')

#### Select a Number of Columns 
df = data.frame(survived=df$survived, 
                pclass=df$pclass, 
		sex=df$sex, 
                age=df$age, 
		sibsp=df$sibsp)

#### Clean New Data Frame  
df = na.omit(df)
#str(df)



#Create a subSet (Sampling 75%) 
subSam = df[sample(1:nrow(df), round(0.75*nrow(df)), replace=F), ]
sr = rownames(subSam)
dr = rownames(df)

#Set - subSet (Remaining 25%)
remSam = df[!(dr %in% sr), ]


#### Training and Testing Data Set
train= subSam 
test = remSam

#### Check: Response Variable must be Categorical
#### If it is Integer, Convert it to Categorical 
if (class(train$survived) == 'integer')
{
  train$survived = as.factor(train$survived)
  test$survived  = as.factor(test$survived)
}


historySurvived = test$survived
t = data.frame(h=historySurvived)
d = length(with(t, h[h==0]))
s = length(with(t, h[h==1]))

options(digits=2)
cat('Tarining Data Set: \n')
cat('Survided :', s,   '\n')
cat('Deceased :', d,   '\n')
cat('Total    :', s+d,   '\n')
cat('                   \n')




#### Logistic Regression 
cat('Logistic Regression Model:',   '\n')
model_glm = glm(survived ~ pclass + sex + age + sibsp,
	        family = binomial(logit), data = train)


summary(model_glm)
modPred_glm = predict(model_glm, test[, 2:5], type='response')


tmp = data.frame(h=historySurvived, p=modPred_glm)
d   = length(with(tmp, h[h==0]))
s   = length(with(tmp, h[h==1]))

# if p >= 0.50 for h=1  TP
# if p <  0.50 for h=1  FN
# if p >= 0.50 for h=0  FP
# if p <  0.50 for h=0  TN
TP = nrow( with(tmp, tmp[(h==1 & p>=0.5), ]) )
FN = nrow( with(tmp, tmp[(h==1 & p <0.5), ]) )
FP = nrow( with(tmp, tmp[(h==0 & p>=0.5), ]) )
TN = nrow( with(tmp, tmp[(h==0 & p <0.5), ]) )

cat('True Positive   :',  TP/s,    '\n')
cat('False Negative  :',  FN/s,    '\n')

## Create Contingency Table 
l = list(c('S', 'D'), c('S', 'D'))
m = matrix(c(TP,FN,FP,TN), ncol=2, byrow=TRUE, dimnames=l)
mytable = as.table(m)
cat('Contingency Table:', '\n')
print(mytable, quote=FALSE)

## Check 
margin.table(mytable, 1)                       # row sum
margin.table(mytable, 2)                       # col sum
cat('Fractional Contingency Table:', '\n')
print(prop.table(mytable,1), quote=FALSE)      # fraction 
cat('                     \n')




#### Naive Bayes Model
#### e1071 Package
cat(                      '\n')
cat('Naive Bayes Model:', '\n')
model_bayes = naiveBayes(survived ~ pclass + sex + age + sibsp,
	                 data = train)


summary(model_bayes)
modPred_bayes = predict(model_bayes, test[, 2:5], type='class')

tmp = data.frame(h=historySurvived, c=modPred_bayes)
d   = length(with(tmp, h[h==0]))
s   = length(with(tmp, h[h==1]))


TP = nrow( with(tmp, tmp[(h==1 & c==1), ]) )
FN = nrow( with(tmp, tmp[(h==1 & c==0), ]) )
FP = nrow( with(tmp, tmp[(h==0 & c==1), ]) )
TN = nrow( with(tmp, tmp[(h==0 & c==0), ]) )

cat('True Positive   :',  TP/s,    '\n')
cat('False Negative  :',  FN/s,    '\n')

## Create Contingency Table 
l = list(c('S', 'D'), c('S', 'D'))
m = matrix(c(TP,FN,FP,TN), ncol=2, byrow=TRUE, dimnames=l)
mytable = as.table(m)
cat('Contingency Table:', '\n')
print(mytable, quote=FALSE)    

# Check 
margin.table(mytable, 1)                       # row sum
margin.table(mytable, 2)                       # col sum
cat('Fractional Contingency Table:', '\n')
print(prop.table(mytable,1), quote=FALSE)      # fraction 
cat('                      \n')

#### Classification Accuracy and Misclassification Error
ca = sum( test$survived == modPred_bayes)/length(test$survived)
ce = 1 - ca
cat('Misclassification Error:', ce, '\n')
#ca = sum(diag(mytable))/margin.table(mytable)
#ce = 1-ca
#print(c('Misclassification Error:', ce), quote=F)
cat(                       '\n')






#### Decision Tree Model
#### Rpart Package
minSplit = 4
cat(                         '\n')
cat('Decision Tree Model 1:','\n')
model_rpart = rpart(survived ~ pclass + sex + age + sibsp,
	            data = train, method ='class', 
                    control = rpart.control(minplit = minSplit, 
                                          minbucket= round(minSplit/2), 
                                          cp = 0.05, 
                                          maxcompete  = 4, 
					  maxsurrogate= 5, 
					  usesurrogate= 2, 
					  xval = 10, 
					  surrogatestyle = 0, 
					  maxdepth = 20))


#summary(model_rpart)
modPred_rpart = predict(model_rpart, test[, 2:5], type='class')

tmp = data.frame(h=historySurvived, c=modPred_rpart)
d   = length(with(tmp, h[h==0]))
s   = length(with(tmp, h[h==1]))

TP = nrow( with(tmp, tmp[(h==1 & c ==1), ]) )
FN = nrow( with(tmp, tmp[(h==1 & c ==0), ]) )
FP = nrow( with(tmp, tmp[(h==0 & c ==1), ]) )
TN = nrow( with(tmp, tmp[(h==0 & c ==0), ]) )

cat('True Positive   :',  TP/s,    '\n')
cat('False Negative  :',  FN/s,    '\n')


## Create Contingency Table 
l = list(c('S', 'D'), c('S', 'D'))
m = matrix(c(TP,FN,FP,TN), ncol=2, byrow=TRUE, dimnames=l)
mytable = as.table(m)
cat('Contingency Table:', '\n')
print(mytable, quote=FALSE)    

# Check 
margin.table(mytable, 1)                       # row sum
margin.table(mytable, 2)                       # col sum
cat('Fractional Contingency Table:', '\n')
print(prop.table(mytable,1), quote=FALSE)      # fraction 
cat('                     \n')

#### Classification Accuracy and Misclassification Error
ca = sum( test$survived == modPred_bayes)/length(test$survived)
ce = 1 - ca
cat('Misclassification Error:', ce, '\n')
#ca = sum(diag(mytable))/margin.table(mytable)
#ce = 1-ca
#print(c('Misclassification Error:', ce), quote=F)
cat(                         '\n')






#### Decision Tree Model
#### Tree Package
#minSplit = 4
cat(                         '\n')
cat('Decision Tree Model 2:','\n')
model_tree = tree(survived ~ pclass + sex + age + sibsp,
	            data = train, method ='class', 
                    control = tree.control(nobs = nrow(train), 
		   	     		  mincut = 5, 
                                          minsize = 10,
                                          mindev = 0.01))


#summary(model_tree)
modPred_tree = predict(model_tree, test[, 2:5], type='class')

tmp = data.frame(h=historySurvived, c=modPred_tree)
d   = length(with(tmp, h[h==0]))
s   = length(with(tmp, h[h==1]))

TP = nrow( with(tmp, tmp[(h==1 & c ==1), ]) )
FN = nrow( with(tmp, tmp[(h==1 & c ==0), ]) )
FP = nrow( with(tmp, tmp[(h==0 & c ==1), ]) )
TN = nrow( with(tmp, tmp[(h==0 & c ==0), ]) )


## Create Contingency Table 
l = list(c('S', 'D'), c('S', 'D'))
m = matrix(c(TP,FN,FP,TN), ncol=2, byrow=TRUE, dimnames=l)
mytable = as.table(m)
cat('Contingency Table:', '\n')
print(mytable, quote=FALSE)    

# Check 
margin.table(mytable, 1)                       # row sum
margin.table(mytable, 2)                       # col sum
cat('Fractional Contingency Table:', '\n')
print(prop.table(mytable,1), quote=FALSE)      # fraction 
cat('                     \n')

#### Classification Accuracy and Misclassification Error
ca = sum( test$survived == modPred_tree)/length(test$survived)
ce = 1 - ca
cat('Misclassification Error:', ce, '\n')
#ca = sum(diag(mytable))/margin.table(mytable)
#ce = 1-ca
#print(c('Misclassification Error:', ce), quote=F)
cat(                         '\n')






#### Neural Network
#### NNET Package
cat(                         '\n')
cat('Neural Network Model :','\n')
## NNET Model
model_nnet   <- nnet(survived ~ pclass + sex + age + sibsp, data=train, 
	             size=4)

# NNET Prediction 
modPred_nnet <- predict(model_nnet, test[, 2:5], type='class')


tmp = data.frame(h=historySurvived, c=modPred_nnet)
d   = length(with(tmp, h[h==0]))
s   = length(with(tmp, h[h==1]))

TP = nrow( with(tmp, tmp[(h==1 & c ==1), ]) )
FN = nrow( with(tmp, tmp[(h==1 & c ==0), ]) )
FP = nrow( with(tmp, tmp[(h==0 & c ==1), ]) )
TN = nrow( with(tmp, tmp[(h==0 & c ==0), ]) )


## Create Contingency Table 
l = list(c('S', 'D'), c('S', 'D'))
m = matrix(c(TP,FN,FP,TN), ncol=2, byrow=TRUE, dimnames=l)
mytable = as.table(m)
cat('Contingency Table:', '\n')
print(mytable, quote=FALSE)    

# Check 
margin.table(mytable, 1)                       # row sum
margin.table(mytable, 2)                       # col sum
cat('Fractional Contingency Table:', '\n')
print(prop.table(mytable,1), quote=FALSE)      # fraction 
cat('                     \n')

#### Classification Accuracy and Misclassification Error
ca = sum( test$survived == modPred_tree)/length(test$survived)
ce = 1 - ca
cat('Misclassification Error:', ce, '\n')
#ca = sum(diag(mytable))/margin.table(mytable)
#ce = 1-ca
#print(c('Misclassification Error:', ce), quote=F)
cat(                         '\n')




## NEURALNET Model
#model_neuralNet <- neuralnet(survived ~ pclass + sex + age + sibsp, 
#		              data=train, hidden=4, 
#                             err.fct="ce", linear.output=FALSE)






#### Random Forest Model
#### randomForest Package
cat(                         '\n')
cat('Random Forest Model  :','\n')
model_rf <- randomForest(survived ~ pclass + sex + age + sibsp, data=train, 
	    	         ntree=500, mtry=2, importance=TRUE)



#print( (model_rf) )
#print( importance(model_rf) )
modPred_rf = predict(model_rf, test[, 2:5], type='response')
#varImpPlot(model_rf, color='blue', pch=16, cex=0.8, cex.lab=0.75, cex.main=0.5) ) 


tmp = data.frame(h=historySurvived, c=modPred_rf)
d   = length(with(tmp, h[h==0]))
s   = length(with(tmp, h[h==1]))

TP = nrow( with(tmp, tmp[(h==1 & c ==1), ]) )
FN = nrow( with(tmp, tmp[(h==1 & c ==0), ]) )
FP = nrow( with(tmp, tmp[(h==0 & c ==1), ]) )
TN = nrow( with(tmp, tmp[(h==0 & c ==0), ]) )


## Create Contingency Table 
l = list(c('S', 'D'), c('S', 'D'))
m = matrix(c(TP,FN,FP,TN), ncol=2, byrow=TRUE, dimnames=l)
mytable = as.table(m)
cat('Contingency Table:', '\n')
print(mytable, quote=FALSE)    

# Check 
margin.table(mytable, 1)                       # row sum
margin.table(mytable, 2)                       # col sum
cat('Fractional Contingency Table:', '\n')
print(prop.table(mytable,1), quote=FALSE)      # fraction 
cat('                     \n')

#### Classification Accuracy and Misclassification Error
ca = sum( test$survived == modPred_rf)/length(test$survived)
ce = 1 - ca
cat('Misclassification Error:', ce, '\n')
#ca = sum(diag(mytable))/margin.table(mytable)
#ce = 1-ca
#print(c('Misclassification Error:', ce), quote=F)






#### Conditional Tree Model
model_cf <- cforest(survived ~ pclass + sex + age + sibsp, data=train, 
	            control = cforest_unbiased(mtry = 2))


model_ct  = ctree(survived ~ pclass + sex + age + sibsp, data=train)
#    		  contols =ctree_control(teststat ="quad", 
#		  	  testtype ="MonteCarlo", 
#                   	   mincriterion = 0.95, 
#			   minsplit = 4, 
#			   minbucket= 2, 
#                   	   stump = FALSE, 
#			   nresample = 9999, 
#			   #maxsurrogate = 0, 
#                   	   mtry = 0, 
#			   savesplitstats = TRUE, 
#			   maxdepth = 0))
#			  


# summary(model_ct) 
# Use Data Model to Predict
modPred_ct = predict(model_ct, test[, 2:5], type='prob')





# Plot the performance of the model applied to the Test dataset 
# Use ROCR package 
a = unlist(modPred_ct)
b = matrix(a, ncol=2, byrow=TRUE)
x1= b[, 2]
x2= test[, 1] 


# Prediction from ROCR package: 'pred' is a class with 11 slots
pred <- prediction(x1, x2)

##
par(mfrow=c(2,2))
# ROC curve
perfROC <- performance(pred, measure="tpr", x.measure="fpr")
plot(perfROC, main="ROC Curve", colorize=T)
 

# Precision Chart
perfPRE <- performance(pred, measure="prec", x.measure="rec")
plot(perfPRE, main="Precision/Recall Curve", colorize=T)
 

# Sensitivity/specificity 
perfSEN <- performance(pred, measure="sens", x.measure="spec")
plot(perfSEN, main="Sensitivity/Specificity Curve", colorize=T)


# Lift chart
perfLIFT <- performance(pred, measure="lift", x.measure="rpp")
plot(perfLIFT, main="Lift Curve", colorize=T)







#model <- rpart(y ~ x, data = data, method = 'class',
#               parms = list(loss = matrix(c(0,1,2,0), nrow=2), split= 'gini'))
#
#model <- rpart(y ~ x, data = data, method = 'class',
#       	parms = list(prior = c(0.65, 0.35), split = "information")
#
#fit1 <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
#fit2 <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis,
#              parms = list(prior = c(0.65, 0.35), split = "information"))
#fit3 <- rpart(Kyphosis ~ Age + Number + Start, data=kyphosis,
#control = rpart.control(cp = 0.05))

#par(mfrow = c(1,2), xpd =TRUE)
#plot(fit1, uniform=TRUE, compress=TRUE, margin=0.1, branch=0.0)
#text(fit1, cex=0.8, use.n=TRUE)
#plot(fit2, uniform=TRUE, compress=TRUE, margin=0.1, branch=0.5)
#text(fit2, cex=0.8, use.n=TRUE)





