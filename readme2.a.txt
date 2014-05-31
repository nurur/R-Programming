Note 1:

It seems to me that there is a bug in the function "score.sentiment"!
The 'gsub()' function used inside the code to get rid of the punctuation 
marks, control characters and digits does not clean the data properly.
 
For example: if you have a tweet:
@Matt: I like this restaurant :-)    (a smile face or a thumbs up sign)
#Matt: I like this restaurant :-)    (a smile face or a thumbs up sign)


unicode character for smily face is: \ud83d\ude04 


The gsub('[[:punct:]]', '', text) takes care of the first punctuation 
mark but the those signs remains behind as unicode characters. You do 
not see them until you hit the 'tolower()' function which can't convert 
these characters to the expected letters and the code gives the following 
error message:   

[1] "Delta pleasantly surprised with the affordable fares to the chs office 
from aus youre making commuting possible again"
  |==============                                                  |  21%
[1] "AMAZING First trip to Italy flying BusinessElite \ud83d\udc9b Delta great 
job on the new interior classy \u2728view from up front is perfect\ud83c\uddee\ud83c\uddf9"

Error in tolower(sentence) : 
  invalid input 'AMAZING First trip to Italy flying BusinessElite ?????? Delta great job on the new interior classy ✨view from up front is perfect????????????' in 'utf8towcs'



Solution:
Interestingly a simply addition of additional gsub() function removes this. 
The function reads as:

sentence = gsub('\\W', ' ', sentence)

This gsub() basically removes all the white spaces between words by a new 
white space and the problem disappears. 
----> Note that there is a space in between the single quotes in the middle <---




Note 2: 
There is a typo in the name of Southwest Airline  
southwest.tweets = searchTwitter('@SouthwestAir', n=2500)    wrongsouthwest.tweets = searchTwitter('@Southwest',    n=2500)    correct



Note 3:
The JetBlue code name appears conflicting: Once as B6 and then BC
I have retained one name and call it BC within the code.  
