# Script to read CSV file in R

# The columns in the input files have names 
# The columns are comma seperated

f = read.csv("inputFile.csv",   header= TRUE, sep=",")
print(f)