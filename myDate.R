#
Sys.Date()
class(Sys.Date())                  #"Date"
mode(Sys.Date())                   #"numeric"
typeof(Sys.Date())                 #"double"

class(as.character(Sys.Date()))    #"character"
mode(as.character(Sys.Date()))     #"character"
typeof(as.character(Sys.Date()))   #"character"


#
as.Date('2001-4-26')                           #"2001-04-26"
as.Date('2001/04/26')                          #"2001-04-26"
as.Date('4/26/2001',format='%m/%d/%Y')         #"2001-04-26"
as.Date('April 26, 2001',format='%B %d, %Y')   #"2001-04-26"
as.Date('26APR01',format='%d%b%y')             #"2001-04-26"

as.Date("12/31/2010", format='%m/%d/%y')
as.Date("12/31/2010", format='%m/%d/%Y')

as.Date("12/31/10", format='%m/%d/%y')         #"2010-12-31"
as.Date("12/31/10", format='%m/%d/%Y')         #"0010-12-31"

