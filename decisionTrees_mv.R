
library(mvpart)

data(spider)
fix(spider)


# Let R pick the best tree
mvpart(data.matrix(spider[,1:12]) ~ herbs+reft+moss+sand+twigs+water, data=spider)


#Pick the tree size yourself
mvpart(data.matrix(spider[,1:12]) ~ herbs+reft+moss+sand+twigs+water, 
       data=spider, xv="p")

# Do PCA on environmental variables
model <- mvpart(data.matrix(spider[,1:12]) ~ herbs+reft+moss+sand+twigs+water, 
         data = spider, xv="1se", pca=TRUE)


#Create an interactive PCA plot of saved multivariate tree
rpart.pca(model, interact=TRUE, wgt.ave=TRUE)

#summary of statistics
summary(model)