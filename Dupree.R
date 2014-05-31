#Read data as csv file
df = read.csv('Dupree.csv', header=T, sep=',')

#Create a subSet (Sampling 70%) 
subSam = df[sample(1:nrow(df), 28, replace=F), ]
sr = rownames(subSam)
dr = rownames(df)

#Set - subSet (Remaining 30%)
remSam = df[!(dr %in% sr), ]



#Check for colinearity
x=subSam$DegreeDays
y=subSam$HomeIndex
z=subSam$NumberPeople
pairs(~x+y+z, labels=c('Degree Days', 'Home Index','Number of People'), 
      pch=1, cex=0.75, upper.panel=NULL)



#Multiple Regression 
#factor HomeIndex and NumberOfPeople
fit1 = lm(OilUsage ~ DegreeDays + factor(HomeIndex) + 
         factor(NumberPeople), data=subSam)
fit2 = lm(OilUsage ~ DegreeDays + factor(HomeIndex), data=subSam)



#Summary of the model
summary(fit1)
summary(fit2)



#Define output from model 2
beta = coef(fit2)



#Predictors from the Remaining 30%
x1 = remSam$DegreeDays 
x2 = remSam$HomeIndex
 
#Observed oil usage (observed response) 
y = remSam$OilUsage

#Predicted oil usage (predicted response)
#An empty vector to fill in 
yhat  = vector()  


#Find the predicted oil usage for each row 
nrows = dim(remSam)[1]
for (i in 1:nrows)
{
if (x2[i] == 1) 
{yhat[i] = beta[1] +  beta[2]*x1[i] + 0.}
else if (x2[i] == 2)
{yhat[i] = beta[1] +  beta[2]*x1[i] + beta[3]}
else if (x2[i] == 3)
{yhat[i] = beta[1] +  beta[2]*x1[i] + beta[4]}
else if (x2[i] == 4)
{yhat[i] = beta[1] +  beta[2]*x1[i] + beta[5]}
else 
{yhat[i] = beta[1] +  beta[2]*x1[i] + beta[6]}
}




#Plot residuals and quantiles  
x   = seq(1,12,1)
res = y-yhat
par(mfrow=c(2,1), cex.main=0.9)
plot(x, res, main='Residual Plot', xlab='X', ylab='Residuals', pch=20)
qqnorm(res, pch=20)



#Hard copy 
pdf('Dupree.pdf')
par(mfrow=c(2,1), cex.main=0.9)
plot(x, res, main='Residual Plot', xlab='X', ylab='Residuals', pch=20)
qqnorm(res, pch=20)
dev.off()

