#Read data as csv file
df = read.csv('data_subSetData.csv', header=TRUE, sep=',')


#Create a subSet (Sampling 70%) 
subSam = df[sample(1:nrow(df), 28, replace=F), ]
sr = rownames(subSam)
dr = rownames(df)


#Set - subSet (Remaining 30%)
remSam = df[!(dr %in% sr), ]

