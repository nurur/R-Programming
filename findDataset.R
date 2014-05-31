
library(utils)


data()                         # list all available data sets
data(package = "rpart")        # list the data sets in the rpart package

data(USArrests, "VADeaths")    # load the data sets 'USArrests' and 'VADeaths'

## Alternatively
ds <- c("USArrests", "VADeaths"); data(list = ds)
help(USArrests)                # give information on data set 'USArrests'
