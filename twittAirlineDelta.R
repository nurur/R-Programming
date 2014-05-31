#Load the required libraries 
library(twitteR)
library(ROAuth)
library(RCurl) 
library(RJSONIO)
library(RJSONIO)
library(plyr)
library(stringr)
library(doBy)
library(ggplot2)
library(XML)

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
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    # clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)

    sentence = gsub('\\W', ' ', sentence)
    #sentence = gsub('\\W[^a-z]', '', sentence)

    #sentence = gsub('\ud83c+', '', sentence)
    #sentence = gsub('\ud83d+', '', sentence)
    #sentence = gsub('\udc4e+', '', sentence) 
    #sentence = gsub('\udc4c+', '', sentence) 
    #sentence = gsub('\ude04+', '', sentence)
    #sentence = gsub('\ude20+', '', sentence)
    #sentence = gsub('\ude21+', '', sentence)
    #sentence = gsub('\uddfa+', '', sentence)
    #sentence = gsub('\uddfd+', '', sentence)
    #sentence = gsub('\uddf8+', '', sentence)
    #sentence = gsub('\ude1d+', '', sentence)

 
    #print(sentence)

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


hu.liu.pos <- scan('/Users/nurur/ugw/positive-words.txt', 
                    what='character', comment.char=';')
hu.liu.neg <- scan('/Users/nurur/ugw/negative-words.txt', 
                    what='character', comment.char=';')

# Add industry specific words
pos.words = c(hu.liu.pos, 'upgrade')
neg.words = c(hu.liu.neg, 'wft', 'wait', 'waiting', 'epicfail', 'mechanical')


southwest.tweets = searchTwitter('@southwest', n=2500)
southwest.text   = laply(southwest.tweets, function(t) t$getText())
southwest.scores = score.sentiment(southwest.text, pos.words, neg.words, .progress='text')
southwest.scores$airline = 'Southwest'
southwest.scores$code = 'WN'
southwest.scores
hist(southwest.scores$score)



library(ggplot2)
qplot(southwest.scores$score)