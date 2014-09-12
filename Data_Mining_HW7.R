############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 7 
### Shell Scripts
############################################################################################
############################################################################################

# Q3. (15 points) From the class notes, carry out the exercise on State of the Union speeches. 
# You can do this either on your laptop or using R in unix.

# (a) Use readLines() to read in the speeches (available as a text file on courseworks) where 
# the return value is: character vector with one element/character string per line in the file

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 7")
StateOfUnionSpeeches <- readLines("StateOfUnionSpeeches.txt")

# (b) Use regular expressions to find ***

BreaksBetweenSpeeches <- grep(pattern="\\*\\*\\*", x=StateOfUnionSpeeches)

# (c) Use *** to identify the date of the speech

Dates <- as.character(StateOfUnionSpeeches[BreaksBetweenSpeeches + 4])
Dates <- Dates[c(4:217)]
head(Dates, 12)
# [1] "January 8, 1790"   "December 8, 1790"  "October 25, 1791"  "November 6, 1792"  "December 3, 1793"  "November 19, 1794"
# [7] "December 8, 1795"  "December 7, 1796"  "November 22, 1797" "December 8, 1798"  "December 3, 1799"  "November 11, 1800"


# (d) Use regular expressions to extract the year

YearPosition <- as.numeric((gregexpr(pattern="[[:digit:]]{4}", text=Dates)))
Year <- as.numeric(substr(x=Dates, start=YearPosition, stop=YearPosition + 4))
head(Year, 12)
# [1] 1790 1790 1791 1792 1793 1794 1795 1796 1797 1798 1799 1800


# (e) Use regular expressions to extract the month

Month_word <- gsub(pattern=paste0(" ", "[[:digit:]]+", ", ", "[[:digit:]]+"), replacement="", x=Dates)
head(Month_word, 10)
# [1] "January"  "December" "October"  "November" "December" "November" "December" "December" "November" "December" 
Month_numeric <- as.numeric(sapply(X=Month_word, FUN=switch, 
                            "January" = 1, "February" = 2, "March" = 3, "April" = 4, "May" = 5, "June" = 6, 
                            "July" = 7, "August" = 8, "September" = 9, "October" = 10, "November" = 11, "December" = 12))
head(Month_numeric, 10)
# [1]  1 12 10 11 12 11 12 12 11 12


# (f) Use *** to extract the name of the president State of the union

Presidents <- StateOfUnionSpeeches[BreaksBetweenSpeeches + 3]
Presidents <- Presidents[c(4:217)]
head(Presidents, 10)
# [1] "George Washington" "George Washington" "George Washington" "George Washington" "George Washington" "George Washington"
# [7] "George Washington" "George Washington" "John Adams"        "John Adams"        
unique(Presidents)
#  [1] "George Washington"     "John Adams"            "Thomas Jefferson"      "James Madison"         "James Monroe"         
#  [6] "John Quincy Adams"     "Andrew Jackson"        "Martin van Buren"      "John Tyler"            "James Polk"           
# [11] "Zachary Taylor"        "Millard Fillmore"      "Franklin Pierce"       "James Buchanan"        "Abraham Lincoln"      
# [16] "Andrew Johnson"        "Ulysses S. Grant"      "Rutherford B. Hayes"   "Chester A. Arthur"     "Grover Cleveland"     
# [21] "Benjamin Harrison"     "William McKinley"      "Theodore Roosevelt"    "William H. Taft"       "Woodrow Wilson"       
# [26] "Warren Harding"        "Calvin Coolidge"       "Herbert Hoover"        "Franklin D. Roosevelt" "Harry S. Truman"      
# [31] "Dwight D. Eisenhower"  "John F. Kennedy"       "Lyndon B. Johnson"     "Richard Nixon"         "Gerald R. Ford"       
# [36] "Jimmy Carter"          "Ronald Reagan"         "George H.W. Bush"      "William J. Clinton"    "George W. Bush" 


# (g) Chop the speeches up into a list there is one element for each speech. Each element is a character vector.

SpeechList <- list()
for (i in 4:217){
  SpeechList[[i]] <- paste(StateOfUnionSpeeches[(BreaksBetweenSpeeches[i]+6):BreaksBetweenSpeeches[i+1]-1], sep="", collapse="")
}
SpeechList <- SpeechList[-3]
SpeechList <- SpeechList[-2]
SpeechList <- SpeechList[-1]


# (h) Now make each element of the vector a character string corresponding to a sentence in the speech Word Vectors

SpeechSentences <- list()
for(i in 1:length(SpeechList))
{
  SpeechSentences[[i]] <- strsplit(x=SpeechList[[i]], split="\\. ")
}


# (i) Eliminate apostrophes, numbers, and the phrase: (Applause.) from the text.

for(i in 1:length(SpeechList))
{
  SpeechList[[i]] <- gsub(pattern="\\'", replacement="", x=SpeechList[[i]])
  SpeechList[[i]] <- gsub(pattern="[[:digit:]]", replacement="", x=SpeechList[[i]])
  SpeechList[[i]] <- gsub(pattern="(Applause.)", replacement="", x=SpeechList[[i]])
}


# (j) Make all the characters lower case.

SpeechList <- tolower(SpeechList)

# (k) Split the sentences up where there are blanks and punctuation

SpeechList <- unlist(strsplit(x=SpeechList, split="([[:blank:]]|[[:punct:]])"))

# (l) Drop any empty words that resulted from this split

SpeechList <- SpeechList[SpeechList != ""]

# (m) Load the library Rstem and use the function wordStem() to stem words

require(SnowballC)
SpeechList <- wordStem(SpeechList) 


# (n) Find the bag of words - what is it?

require(tm)
SpeechListCorpus <- Corpus(VectorSource(SpeechList))
SpeechListCorpus<- tm_map(x=SpeechListCorpus, FUN=removePunctuation)
my_stopwords <- c(stopwords('english'))
SpeechListCorpus <- tm_map(x=SpeechListCorpus, FUN=removeWords, my_stopwords)
SpeechTermDocumentMatrix <- TermDocumentMatrix(SpeechListCorpus)
BagOfWords <- as.matrix(SpeechTermDocumentMatrix)

# (o) Create a word vector for each speech

SpeechSentences <- list()
for(i in 1:length(SpeechList))
{
  SpeechSentences[[i]] <- strsplit(x=SpeechList[[i]], split=" ")
}

require("Snowball")
speechToWords = function(sentences)
{
  s1=gsub("'","",sentences)
  s2=gsub("[[:digit:]]","",s1)
  s3=gsub("(Applause.)","",s2)
  s4=tolower(s3)
  s5=strsplit(s4,"([[:blank:]]|[[:punct:]])")
  s6=unlist(s5)
  s7=s6[s6!=""]
  s8=wordStem(s7) 
  return(s8)
}