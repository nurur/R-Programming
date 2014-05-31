#install.packages("caret")
#install.packages("party")
#install.packages("randomForest")


mydata = read.csv("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv")
#colnames(mydata)
#nrow(mydata)
#ncol(mydata)
#colnames(data)[2] <- 'column 2'

# CREATE A DATASET WITH NO MISSING VALUES
mydata.subset <- subset(mydata, select = c(survived, pclass, sex, age, sibsp))
mydata.nomiss <- na.omit(mydata.subset)


##########################################################################
## GLM LOGISTIC
##########################################################################
# LOAD CARET PACKAGE
library(caret)

# BUILD A CONDITIONAL TREE MODEL WITH TITANIC DATA
t.lr = glm(survived ~ pclass + sex + pclass:sex + age + sibsp, data = mydata.nomiss, family = binomial(logit))

# ESTIMATE THE PROBABILITIES OF SURVIVAL BASED ON MODEL
#prob <- predict(t.lr, type="response")
pred.survived.lr <- predict(t.lr, type="response")

# PREPARE TO ASSIGN VALUES 0 OR 1 BASED ON PROBABILITIES
a <- confusionMatrix(round(pred.survived.lr), mydata.nomiss$survived, positive='1')

# SEE WHAT THE OBJECT a CONTAINS
names(a)

# SHOW THE CONFUSION MATRIX
a <- a$table

# COMPUTE THE ACCURACY OF THE MODEL
(a$table[1,1] + a$table[2,2])/sum(a$table)

##########################################################################
## CONDITIONAL TREE
##########################################################################
# LOAD PARTY PACKAGE
library(party);

# BUILD A CONDITIONAL TREE MODEL WITH TITANIC DATA
t.ct <- ctree(as.factor(survived) ~ pclass + sex + age + sibsp, data=mydata.nomiss, controls = ctree_control(mincriterion = 0.95))

# PREDICT SURVIVAL USING TREE MODEL
#pred.survived.ct <- predict(t.ct);
pred.survived.ct <- predict(t.ct, type="response")

# PREPARE TO ASSIGN VALUES 0 OR 1 BASED ON PROBABILITIES
#b <- confusionMatrix(round(pred.survived.ct), mydata.nomiss$survived, positive='1')


# CALCULATE CONFUSION MATRIX
#attach(mydata);
b <- table(survived, pred.survived.ct, deparse.level = 2);

# PLOT THE TREE DIAGRAM
plot(t.ct, cex=0.8);

##########################################################################
## RANDOM FORESTS
##########################################################################
# LOAD RANDOMFOREST PACKAGE
library(randomForest)

# BUILD A RANDOM FOREST MODEL WITH TITANIC DATA
t.rf = randomForest(as.factor(survived) ~ pclass + sex + age + sibsp, data=mydata.nomiss, ntree=5000)

# SEE WHAT THE MODEL OBJECT CONTAINS
names(t.rf)

# SEE THE CONFUSION MATRIX
c <- t.rf$confusion

# OBTAIN PERCENTAGE MISCLASSIFIED
correctClassified <- sum(diag(t.rf$confusion))/sum(t.rf$confusion)