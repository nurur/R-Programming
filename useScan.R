# Interactive Command Line Input 
# scan() reads string, interger, double, and complex 


# From Console
# Return a vector
a <- scan("", what="")
b <- scan("", what=integer())
c <- scan("", what=double())
d <- scan("", what=complex())


# From File (2 columns: age & name)
# Return a list
x <- scan("useScan.txt", what=list(age=0, name=""))