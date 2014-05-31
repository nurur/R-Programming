#Load 'e1071' package for the NaiveBayes functions
library(e1071)

myData <- read.csv("NaiveBayes_FlightDelays.csv",header=TRUE)


#Plot the feature variables categorized by the group membership
par(mfrow=c(2,2))
plot (Carrier  ~ Flight_Status, data=myData)
plot (Dest     ~ Flight_Status, data=myData)
plot (Origin   ~ Flight_Status, data=myData)
plot (Day_Week ~ Flight_Status, data=myData)
par(mfrow=c(1,1))

#Calculate the conditional probabilities
classifier <- naiveBayes(myData[,2:6], myData[,1])
classifier

#Predicting classes of observation 1 to 10
predict(classifier, myData[54,2:6])

#Predicting class of observation number 54
predict(classifier, myData[54,-1])

#Predicting the class membership probability of observation number 54
predict(classifier, myData[54,-1], type="raw")
