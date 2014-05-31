#Binary two-mode networks

#The following code requires a binary two-mode network to be listed in an edgelist 
#format with two columns named i and p. The i column refers to the nodes you would 
#like to keep in the one-mode projection (e.g., the blue nodes), and the p column 
#refers to the nodes you would like to discard (e.g., the red nodes). The binary 
#two-mode network in the diagram above can be loaded using the following function.


# Load tnet
library(tnet)
 

net <- cbind(
i=c(1,1,2,2,2,2,2,3,4,5,5,5,6),
p=c(1,2,1,2,3,4,5,2,3,4,5,6,6))

#The one-projections highlighted above can be created using the following code:

# Binary one-mode projection
projecting_tm(net, method="binary")
 
# Simply the number of common red nodes
projecting_tm(net, method="sum")
 
# Newman's method
projecting_tm(net, method="Newman")



#Weighted two-mode networks
#The following code requires a weighted two-mode network to be listed in an 
#edgelist format with three columns named i, p, and w. The i column refers to the 
#nodes you would like to keep in the one-mode projection (e.g., the blue nodes), 
#the p column refers to the nodes you would like to discard (e.g., the red nodes), 
#and the w column must be the weight of the ties. The weighted two-mode network 
#in the diagram above can be loaded using the following function.


net.w <- cbind(
i=c(1,1,2,2,2,2,2,3,4,5,5,5,6),
p=c(1,2,1,2,3,4,5,2,3,4,5,6,6),
w=c(4,2,2,1,4,3,2,5,6,2,4,1,1))


#The one-projections highlighted above can be created using the following code:

# Simply the sum of weights towards common red nodes
projecting_tm(net.w, method="sum")
 
# Generalisation of Newman's method
projecting_tm(net.w, method="Newman")

