library(quantmod)
library(TTR)
library(gclus)


par(mfrow=c(3,2))


#The getSymbols function is used to retrieve stock data
symbols = c("GOOG","YHOO", "GS", "MS","IBM")
getSymbols(symbols) 


###################################################################
##Plot a subset of each company data seperately  
##
##Google 
chart_Series(GOOG, subset='2013', TA=NULL, name="Google Stock Price for 2013")
#addVo();
#addBBands();
#addCCI();
##Yahoo
chart_Series(YHOO, subset='2013', TA=NULL, name="Yahoo Stock Price for 2013")
##Goldman Sachs
chart_Series(GS,   subset='2013', TA=NULL, name="Goldman Sachs Stock Price for 2013")
##Morgan Stanley
chart_Series(MS,   subset='2013', TA=NULL, name="Morgan Stanley Stock Price for 2013")
##IBM
chart_Series(IBM,  subset='2013', TA=NULL, name="IBM Stock Price for 2013")


###################################################################
#Plot all company data together 
chart_Series(c(GOOG,YHOO,GS,MS,IBM), subset='2013', TA="", name=NULL)

#chart_Series(GOOG, subset='2013', TA="", name=NULL, clev=10)
#par(new=TRUE)
#chart_Series(YHOO, subset='2013', TA="", name=NULL)
#axis(side=2, tick=FALSE, labels=FLASE)
#par(new=TRUE)
#chart_Series(IBM, subset='2013', TA="", name=NULL)
#axis(side=2, labels=FLASE)


title("Stock Prices: Google, IBM, Goldman Sachs, Yahoo, and Morgan Stanley 
(in Descending Order)",  cex.main = 0.8,  font.main= 2, col.main= "blue")
mtext(text= "text1\ntext2\ntext3", side=1, cex = 0.75, font = 3, col="red",line=7)


###################################################################
#Plotting correlation data
a=GOOG['2013-10-02::2013-10-17']
b=YHOO['2013-10-02::2013-10-17']
c=  GS['2013-10-02::2013-10-17']
d=  MS['2013-10-02::2013-10-17']
e= IBM['2013-10-02::2013-10-17']

#Create a dataframe 
cn = 6
df = data.frame(a[,cn], b[,cn], c[,cn], d[,cn], e[,cn])
#df = data.frame(a$GOO.Open, b$YHOO.Open, c$GS.Open, d$MS.Open, e$IBM.Open)

colnames(df) = c("Google", "Yahoo", "GoldSach", "MorgStan", "IBM")
#pairs(~Google+Yahoo+GoldSach+MorgStan+IBM, data=df, pch=20, cex=0.25)
  
dim = length(df$Google)
cpairs(df, panel.colors=data.col, gap=.5, pch=20, cex=0.25, 
main="Variables Ordered and Colored by Correlation") 

print('                               ')
print('Printing correlation matrix ...')
corMat = cor(df)
print(corMat)
print('                               ')



#Use gclus library to get a color scatter plot
#data     <- df[c(1,2,3,4,5)]    # get data
#data.r   <- abs(cor(data))      # get correlations
data.col <- dmat.color(data.r)   # get colors
# Reorder variables so those with highest correlation are closest to the diagonal
#data.o   <- order.single(data.r)
#cpairs(data, data.o, panel.colors=data.col, gap=.5,
#main="Variables Colored by Correlation", pch=20, cex=0.25) 

#corMat = cor(df)
#image(x=seq(1,5), y=seq(1,5), z=corMat, 
#main="Variables Ordered and Colored by Correlation")
#text(expand.grid(x=seq(1,5), y=seq(1,5)), labels = round(c(corMat),2) )


#chartSeries(a, TA=NULL)
#barChart(a, theme='white.mono', bar.type='hlc', TA=NULL) 
#candleChart(a,multi.col=TRUE,theme='white', TA=NULL)
