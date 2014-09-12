############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 6 
### Regular Expressions
############################################################################################
############################################################################################

##############################################################
### 1. Write down a regular expression to match the following:
##############################################################

### Words with @ symbols in them, e.g., vi@gra
x = c("vi@gra", "g@me", "apple", "ssssssss@ffffff", "s@d")
x # [1] "vi@gra"          "g@me"            "apple"           "ssssssss@ffffff" "s@d"     
grep(pattern="\\@", x=x)
# [1] 1 2 4 5


### An ip address (4 sets of 1-3 digits separated by periods, e.g., 124.32.6.240)
y = c("124.32.6.240", "123.32.8.880", "124.38.6.400", "127.45.9.120") 
y # [1] "124.32.6.240" "123.32.8.880" "124.38.6.400" "127.45.9.120"
grep(pattern="^[0-9]*\\.[0-9]*\\.[0-9]*\\.[0-9]*$", x=y)
# [1] 1 2 3 4


### A typical email address that ends with .com, .edu, .net, .org, or .gov
z = c("abc_1234@gmail.com", "ABC!1234@columbia.edu", "xyz2013@verizon.net", "mno.zxy.2013@abc.org", "123@hotmail.gov")
z # [1] "abc_1234@gmail.com"    "ABC!1234@columbia.edu" "xyz2013@verizon.net"   "mno.zxy.2013@abc.org"  "123@hotmail.gov" 

### first option using wild cards
grep(pattern="^.*?\\@.*?\\..*?$", x=z) 
# [1] 1 2 3 4 5

# second option using letters, numbers and punctuation
grep(pattern="^[a-zA-Z0-9\\,\\.\\?/'\\|\\+=-_\\)\\(\\*\\&\\^%\\$#\\!`~)]+@[a-zA-Z0-9]+\\.[a-zA-Z]{3}$", x=z) 
# [1] 1 2 3 4 5

###############################################
### 2. Consider the following character vector,
###############################################

movies = c("The Shawshank Redemption (1994)",
           "The Godfather (1972)",
           "The Godfather: Part II (1974)",
           "Pulp Fiction (1994)",
           "The Good, the Bad and the Ugly (1966)", 
           "12 Angry Men (1957)")
movies
# [1] "The Shawshank Redemption (1994)"
# [2] "The Godfather (1972)"
# [3] "The Godfather: Part II (1974)"
# [4] "Pulp Fiction (1994)"
# [5] "The Good, the Bad and the Ugly (1966)" 
# [6] "12 Angry Men (1957)"

### What is the return expression from each of the following function calls:

grep("I{2,}", movies)
# [1] 3

grep("Go+d", movies)
# [1] 2 3 5

gregexpr("\\(.*\\)", movies[1])
# [[1]]
# [1] 26
# attr(,"match.length")
# [1] 6
# attr(,"useBytes")
# [1] TRUE

gsub("[0-9]", "", movies[6])
# [1] " Angry Men ()"

gsub("[[:blank:]].*$", "", movies[5])
# [1] "The"

gsub(" \\(.*$", "", movies[5])
# [1] "The Good, the Bad and the Ugly"

#####################################################################################################
### 3. Run the following R code, gregexpr(pattern, string) where pattern refers to the value in a row 
### of the table and string refers to a value in the column of the table. 
### For example, for the first row and first column, we would run:
### gregexpr("[0-9]{3,4}", "stat133")
### In the corresponding table cell, write down the value that is returned, i.e. the location of the 
### match(es) and length of the match(es), or -1 if no match is found.
#####################################################################################################

gregexpr("[0-9]{3,4}","stat133")
#[[1]]
#[1] 5
#attr(,"match.length")
#[1] 3
#attr(,"useBytes")
#[1] TRUE

gregexpr("[0-9]{3,4}", "statistics")
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[0-9]{3,4}", "I love R!")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[0-9]{3,4}", "May 9, 1945")    
#[[1]]
#[1] 8
#attr(,"match.length")
#[1] 4
#attr(,"useBytes")
#[1] TRUE

gregexpr("[!, ]", "stat133")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[!, ]", "statistics")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[!, ]", "I love R!")  
#[[1]]
#[1] 2 7 9
#attr(,"match.length")
#[1] 1 1 1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[!, ]", "May 9, 1945")  
#[[1]]
#[1] 4 6 7
#attr(,"match.length")
#[1] 1 1 1
#attr(,"useBytes")
#[1] TRUE

gregexpr("st", "stat133")  
#[[1]]
#[1] 1
#attr(,"match.length")
#[1] 2
#attr(,"useBytes")
#[1] TRUE

gregexpr("st", "statistics")  
#[[1]]
#[1] 1 6
#attr(,"match.length")
#[1] 2 2
#attr(,"useBytes")
#[1] TRUE

gregexpr("st", "I love R!")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("st", "May 9, 1945")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[A-Z]+", "stat133")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[A-Z]+", "statistics")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[A-Z]+", "I love R!")  
#[[1]]
#[1] 1 8
#attr(,"match.length")
#[1] 1 1
#attr(,"useBytes")
#[1] TRUE

gregexpr("[A-Z]+", "May 9, 1945")  
#[[1]]
#[1] 1
#attr(,"match.length")
#[1] 1
#attr(,"useBytes")
#[1] TRUE

gregexpr("stat*", "stat133")  
#[[1]]
#[1] 1
#attr(,"match.length")
#[1] 4
#attr(,"useBytes")
#[1] TRUE

gregexpr("stat*", "statistics")  
#[[1]]
#[1] 1
#attr(,"match.length")
#[1] 4
#attr(,"useBytes")
#[1] TRUE

gregexpr("stat*", "I love R!")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE

gregexpr("stat*", "May 9, 1945")  
#[[1]]
#[1] -1
#attr(,"match.length")
#[1] -1
#attr(,"useBytes")
#[1] TRUE