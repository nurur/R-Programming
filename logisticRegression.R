library(aod)
library(ggplot2)


# Logistic Regression
# y is a binary factor and x1-x3 are continuous predictors
 
#fit <- glm(y ~ x1+x2+x3, data=mydata, family=binomial())
#summary(fit)                    # display results
#confint(fit)                    # 95% CI for the coefficients
#exp(coef(fit))                  # exponentiated coefficients
#exp(confint(fit))               # 95% CI for exponentiated coefficients
#predict(fit, type="response")   # predicted values
#residuals(fit, type="deviance") # residuals



#Likelihood-Ratio Test:
#Hosmer-Lemshow Goodness of Fit Test:  


#Example 
# http://www.ats.ucla.edu/stat/r/dae/logit.htm
mydata <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")


summary(mydata)
sapply(mydata, sd)
xtabs(~admit + rank, data = mydata)


mydata$rank <- factor(mydata$rank)
model <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")

summary(model)
vcov(model)



# Wild Test
# Terms are the ordered number of Estimated Eoefficients in 'coef(model)'
wald.test(b = coef(model), Sigma = vcov(model), Terms = 4:6)


wald.test(b = coef(mylogit), Sigma = vcov(mylogit), Terms = 4:6)


t <- cbind(0, 0, 0, 1, -1, 0)
wald.test(b = coef(model), Sigma = vcov(model), L = t)

t <- cbind(0, 0, 0, 1, +1, 0)
wald.test(b = coef(model), Sigma = vcov(model), L = t)



exp(coef(model)
exp(cbind(OR = coef(model), confint(model)))




# Create New Data
newdata1 <- with(mydata, 
           data.frame(gre = mean(gre), gpa = mean(gpa), rank = factor(1:4)))

newdata1$rankp <- predict(mylogit, newdata = newdata, type = "response")
newdata1



newdata2 <- with(mydata, data.frame(
	    		 gre = rep(seq(from=200, to=800, length.out=100), 4), 
                         gpa = mean(gpa), 
                         rank= factor(rep(1:4, each = 100))))

newdata3 <- cbind(newdata2, predict(model, newdata = newdata2, 
	    		    	    type = "link",
                                    se = TRUE))

newdata3 <- within(newdata3, {
    PredictedProb <- plogis(fit)
    LL <- plogis(fit - (1.96 * se.fit))
    UL <- plogis(fit + (1.96 * se.fit))
})

head(newdata3)


#Graphs of predicted probabilities to understand and/or present the model
ggplot(newdata3, aes(x = gre, y = PredictedProb)) + 
      geom_ribbon(aes(ymin = LL,ymax = UL, fill = rank), alpha = 0.2) + 
      geom_line(aes(colour = rank), size = 1)

