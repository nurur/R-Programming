## A simple example with a couple of actors
## The typical case is that these tables are read in from files....


actors <- data.frame(name=c("Alice", "Bob", "Cecil", "David","Emma"),
                     age=c(48,33,45,34,21),
                     gender=c("F","M","F","M","F"))


relations <- data.frame(from=c("Bob", "Cecil", "Cecil", "David","David", "Emma"),
                        to=c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
                        same.dept=c(FALSE,FALSE,TRUE,FALSE,FALSE,TRUE),
                        friendship=c(4,5,5,2,1,1), advice=c(4,5,5,4,2,3))


# Create igraph data frame from R data frame 
g <- graph.data.frame(relations, directed=TRUE, vertices=actors)
print(g, e=TRUE, v=TRUE)



## The opposite operation
# Create R data frame from igraph data frame 
get.data.frame(g, what="vertices")
get.data.frame(g, what="edges")
