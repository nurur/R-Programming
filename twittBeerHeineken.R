#Load the required libraries 
library(twitteR)
library(ROAuth)
library(RCurl) 
library(plyr)
library(stringr)
library(ggplot2)
#
#
options(RCurlOPtions = list(cainfo = system.file("CurlSSL","cacert.pem",
        package="Rcurl")))

#set the directory 
setwd("/Users/nurur/ugw")

#load the authetication data that has been saved 
load("twitter authentication.Rdata")

#Provide OAuth access Token to the twitter session
registerTwitterOAuth(cred)


score.sentiment <- function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  # we got a vector of sentences. plyr will handle a list
  # or a vector as an "l" for us
  # we want a simple array of scores back, so we use
  # "l" + "a" + "ply" = "laply":
  scores = laply(sentences, function(sentence, pos.words, neg.words) 
{
    # clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    sentence = gsub('\\W', ' ', sentence)

    print(sentence)
    # and convert to lower case:
    sentence = tolower(sentence)


    # split into words. str_split is in the stringr package
    word.list = str_split(sentence, '\\s+')

    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)

    # compare our words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)

    # match() returns the position of the matched term or NA
    # we just want a TRUE/FALSE:
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}



hu.liu.pos <- scan('/Users/nurur/ugw/dnsc6205_computation/words-positive-HL.txt', 
                    what='character', comment.char=';')
hu.liu.neg <- scan('/Users/nurur/ugw/dnsc6205_computation/words-negative-HL.txt', 
                    what='character', comment.char=';')

bill.mac.pos <- scan('/Users/nurur/ugw/dnsc6205_computation/words-positive-BM.txt', 
                    what='character')
bill.mac.neg <- scan('/Users/nurur/ugw/dnsc6205_computation/words-negative-BM.txt', 
                    what='character')

# Add industry specific words
pos.words    = c(hu.liu.pos, bill.mac.pos, 'upgrade')
neg.words    = c(hu.liu.neg, bill.mac.pos, bill.mac.neg, 'wft', 'wait', 'waiting', 'epicfail', 'mechanical')



heineken.tweets = searchTwitter('@Heineken', n=100)
heineken.text   = laply(heineken.tweets, function(t) t$getText())
heineken.scores = score.sentiment(heineken.text, pos.words, neg.words, .progress='text')
heineken.scores$airline = 'Heineken'
heineken.scores$code    = 'HK'
#heineken.scores



#Regular histogram plot
#hist(heineken.scores$score)

#ggplot2 histogram plot
qplot(heineken.scores$score)