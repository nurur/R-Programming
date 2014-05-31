
PI = 6000.   #primary investment
FI = 0.0     #final investment 
r  = 0.08    #interest rate 


for(i in 1:30) 
{
 FI = (FI + PI)*(1 + ( r + (-0.02 +0.04*runif(1))) );
 print(FI);
}
