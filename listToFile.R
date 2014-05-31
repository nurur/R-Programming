
myList = list(c(234984, 10354, 41175, 932711, 426928), c(1693237, 13462))

lapply(myList, write, "listToFile.txt", append=TRUE, ncolumns=1000)