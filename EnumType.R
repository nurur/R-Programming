// Enumaration Type in R


levels = c('red', 'green','blue','orange', 'yellow')
a <- factor( c('red', 'green','blue','orange', 'yellow'), labels=levels) 

b <- gl(n=5, k=1, labels=levels )