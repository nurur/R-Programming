#Homework 3
pdf('normality.pdf')

a = c(233,291,312,250,246,197,268,224,239,239,254,276,234,181,248,252,202,218,212,325)
b = c(344,185,263,246,224,212,188,250,148,169,226,175,242,252,153,183,137,202,194,213)

boxplot(a,b, xlab= 'Samples', ylab='Spread', 
        main= 'Boxplot to Check the Normality of Vectors')

#text(1, 340, lebel='Type A')
#text(2, 340, lebel='Type B')


quantile(a)
quantile(b)


dev.off()