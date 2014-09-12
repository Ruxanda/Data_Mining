################################################################################################
################################################################################################
### APPLIED DATA MINING
### HOMEWORK 8 
################################################################################################
################################################################################################

### Load HW8.rda and attach the XML library
setwd("~/Desktop/Homework 8")
require("XML")

##################################
### Part 1.  Create the data frame
##################################

### Look at the instructions in HW6.pdf.
### Functions you'll want to use: xmlParse(), xmlRoot(), xpathSApply(), xmlGetAttr().
### It also might make it easier to use: xmlToList(), merge().
### Load the data frame called LatLon from HW8.rda.  
load("HW8.rda")
require(XML)
dim(LatLon) # [1] 219   4
names(LatLon) # [1] "Country.Name" "CIA.Codes"    "Longitude"    "Latitude" 

### Parse the XML document at: http://www.stanford.edu/~vcs/StatData/factbook.xml
### and create an XML "tree" in R 
CIA_Factbook <- "http://www.stanford.edu/~vcs/StatData/factbook.xml"
CIA_Factbook_parsed <- xmlParse(file=CIA_Factbook)

### Use XPath to extract the infant mortality and the CIA country codes from the XML tree   
### Create a data frame called IM using this XML file.
### The data frame should have 2 columns: for Infant Mortality and CIA.Codes

CIA_Factbook_root <- xmlRoot(x=CIA_Factbook_parsed)
MyRoot <- xmlRoot(x=CIA_Factbook_root)
CIA_Factbook_Infant_Mortality_Rate <- getNodeSet(doc=MyRoot, path='//field[@name="Infant mortality rate"]')
CIA_Factbook_Infant_Mortality_Rate
# [[1]]
# <field dollars="false" unit="(deaths/1,000 live births)" rankorder="1" name="Infant mortality rate" id="f2091">
# <description>This entry gives the number of deaths of infants under one year old in a given year per 1,000 live births in the 
# same year; included is the total death rate, and deaths by sex, <italic>male</italic> and <italic>female</italic>. This rate is 
# often used as an indicator of the level of health in a country.</description>
# <rank number="175.90" dateEstimated="true" dateLatest="2011-12-31" dateEarliest="2011-01-01" dateText="2011 est." country="ao"/>
# <rank number="149.20" dateEstimated="true" dateLatest="2011-12-31" dateEarliest="2011-01-01" dateText="2011 est." country="af"/>
# <rank number="112.22" dateEstimated="true" dateLatest="2011-12-31" dateEarliest="2011-01-01" dateText="2011 est." country="ng"/>
# <rank number="111.35" dateEstimated="true" dateLatest="2011-12-31" dateEarliest="2011-01-01" dateText="2011 est." country="ml"/>
# <rank number="105.56" dateEstimated="true" dateLatest="2011-12-31" dateEarliest="2011-01-01" dateText="2011 est." country="so"/>
# ......................................... Missing Output ....................................................................... 
CIA_Factbook_Infant_Mortality_Rate_Size <- xmlSize(CIA_Factbook_Infant_Mortality_Rate[[1]])

Infant_Mortality <- c()
for(i in 1:CIA_Factbook_Infant_Mortality_Rate_Size) {
  Infant_Mortality[i] = xmlGetAttr(node=CIA_Factbook_Infant_Mortality_Rate[[1]][[i]], name="number") 
  Infant_Mortality = as.numeric(Infant_Mortality[!is.na(Infant_Mortality)])
}
Infant_Mortality
#   [1] 175.90 149.20 112.22 111.35 105.56 102.00  99.38  96.23  95.31  91.54  81.40  81.04  78.95  78.43  78.38  77.30  77.12  76.05  74.52  71.67
#  [21]  68.07  66.93  66.60  64.78  64.04  63.26  63.09  62.63  62.47  61.82  61.56  61.03  60.91  60.44  60.42  59.46  56.42  55.49  55.11  55.04
#  [41]  54.94  54.02  53.21  52.29  51.48  51.45  51.08  50.73  49.95  49.23  48.55  47.57  46.85  45.59  44.54  44.48  43.29  43.20  42.34  42.26
#  [61]  42.16  41.68  41.33  38.89  38.54  38.01  37.26  36.76  34.52  29.50  29.27  27.95  27.69  27.53  27.45  27.11  26.94  26.02  25.92  25.81
#  [81]  25.20  24.34  24.15  23.94  23.74  23.02  22.74  22.64  22.22  22.18  21.95  21.92  21.17  20.90  20.62  20.44  20.30  20.09  19.65  19.34
# [101]  18.85  17.82  17.61  17.29  17.12  16.68  16.42  16.39  16.39  16.38  16.16  16.06  15.85  15.81  15.62  15.47  15.23  15.17  15.02  14.92
# [121]  14.63  14.61  14.60  14.27  13.65  13.63  13.49  12.92  12.78  12.72  12.43  12.43  12.05  11.97  11.94  11.86  11.66  11.64  11.52  11.51
# [141]  11.43  11.14  11.02  11.00  10.81  10.43  10.08  10.05   9.70   9.69   9.66   9.66   9.45   9.38   8.67   8.66   8.54   8.54   8.42   8.07
# [161]   8.07   7.47   7.34   7.27   7.24   7.06   6.69   6.63   6.59   6.54   6.52   6.27   6.25   6.16   6.06   6.06   5.79   5.71   5.61   5.31
# [181]   5.18   5.00   4.92   4.90   4.78   4.72   4.67   4.66   4.62   4.61   4.59   4.44   4.33   4.32   4.32   4.24   4.17   4.16   4.15   4.12
# [201]   4.08   3.98   3.85   3.80   3.73   3.69   3.55   3.54   3.52   3.47   3.43   3.39   3.38   3.29   3.20   3.18   2.90   2.78   2.74   2.47
# [221]   2.32   1.79

Country_Code <- c()
for(i in 1:CIA_Factbook_Infant_Mortality_Rate_Size) {
  Country_Code[i] = xmlGetAttr(node=CIA_Factbook_Infant_Mortality_Rate[[1]][[i]], name="country")
  Country_Code = toupper(Country_Code[!is.na(Country_Code)])
}
Country_Code
#   [1] "AO" "AF" "NG" "ML" "SO" "OD" "CT" "PU" "CD" "NI" "UV" "MI" "MZ" "CG" "SL" "EK" "ET" "CF" "LI" "GA" "SU" "TZ" "ZA" "IV" "RW" "PK" "WZ" "CN"
#  [29] "UG" "BY" "BN" "GV" "CM" "WI" "MR" "LA" "SG" "CB" "YM" "LT" "DJ" "HA" "TP" "KE" "TO" "MA" "AJ" "BG" "GB" "BM" "GH" "IN" "NH" "WA" "NP" "BT"
#  [57] "PP" "SF" "TX" "IR" "BL" "IZ" "ER" "KR" "TI" "TT" "MG" "GY" "TV" "ZI" "KG" "ID" "TD" "MO" "MV" "KN" "CV" "GT" "TS" "AG" "EG" "FM" "KZ" "TU"
#  [85] "RM" "PA" "WS" "NU" "DR" "PE" "BH" "UZ" "BR" "VM" "VE" "HO" "ES" "LY" "EC" "RP" "AM" "BP" "NS" "MX" "GZ" "BU" "JO" "CO" "TH" "SH" "SA" "CH"
# [113] "LE" "CW" "SY" "MU" "MH" "GG" "MY" "WE" "AC" "AL" "JM" "VC" "TN" "VI" "BF" "AA" "DO" "ST" "PS" "MD" "QA" "TK" "AE" "BB" "SE" "PM" "MP" "BX"
# [141] "GJ" "BC" "RO" "FJ" "AR" "BA" "RS" "GL" "CE" "UY" "AQ" "SC" "CS" "CY" "BK" "NR" "MK" "UP" "LG" "KU" "RQ" "SB" "CI" "FP" "VQ" "EN" "GI" "CJ"
# [169] "LO" "PL" "RI" "LH" "BO" "HR" "US" "FO" "CQ" "NC" "EE" "HU" "TW" "GR" "CA" "CU" "NZ" "SM" "WF" "PO" "UK" "AS" "NL" "LU" "BE" "IM" "AU" "DA"
# [197] "SI" "KS" "LS" "IS" "SZ" "JE" "EI" "AN" "EZ" "MT" "GK" "GM" "NO" "AV" "FI" "SP" "IT" "FR" "IC" "MC" "HK" "JA" "SW" "BD" "SN" "MN"

IM <- data.frame("Infant Mortality" = Infant_Mortality, "CIA.Codes" = Country_Code)
dim(IM) # [1] 222   2
head(IM)
#   Infant.Mortality CIA.Codes
# 1           175.90        AO
# 2           149.20        AF
# 3           112.22        NG
# 4           111.35        ML
# 5           105.56        SO
# 6           102.00        OD


### Extract the country populations from the same XML document
### Create a data frame called Pop using these data.
### This data frame should also have 2 columns, for Population and CIA.Codes

CIA_Factbook_Population <- getNodeSet(doc=MyRoot, path='//field[@name="Population"]')
CIA_Factbook_Population_Size <- xmlSize(CIA_Factbook_Population[[1]]) 

Population <- c()
for(i in 1:CIA_Factbook_Population_Size) {
  Population[i] = xmlGetAttr(node=CIA_Factbook_Population[[1]][[i]], name="number")
  Population = as.numeric(Population[!is.na(Population)])
}
Population
#   [1] 1336718015 1189172906  313232044  245613043  203429773  187342721  158570535  155215573  138739892  126475664  113724226  101833938   90873739
#  [14]   90549390   82079636   81471834   78785548   77891220   71712867   66720153   65312249   62698362   61016804   53999804   49004031   48754657
#  [27]   46754784   45134707   45047502   44725543   42746620   41769726   41070934   38441588   34994937   34612250   34030589   31968361   30399572
#  [40]   29835392   29391883   29248943   28728607   28128600   27635743   26131703   24791073   24457492   24133492   23071779   22948858   22517750
#  [53]   21926221   21904551   21766711   21504162   21283913   19711291   16888760   16847007   16751455   16468886   15879252   15522373   15007343
#  [66]   14701717   14159904   13881336   13824463   13338541   12643799   12084304   11370425   11087330   10760305   10760136   10758945   10629186
#  [79]   10601009   10431477   10216190   10190213   10118683    9976062    9956648    9925640    9719932    9577552    9325032    9088728    8372373
#  [92]    8260490    8217280    8143564    7639961    7627200    7473052    7310555    7122508    7093635    6771993    6597960    6508271    6477211
# [105]    6459058    6187591    6071774    5939484    5666301    5587443    5529888    5477038    5363669    5259250    5148664    4997503    4950027
# [118]    4740737    4691849    4670976    4622163    4585874    4576562    4483804    4314377    4290347    4243929    4143101    3989133    3786764
# [131]    3535547    3460462    3308535    3281634    3133318    3027959    2994667    2967975    2868380    2595628    2568555    2204708    2147585
# [144]    2077328    2065398    2000092    1924886    1825632    1797860    1657155    1596677    1576665    1370424    1303717    1282963    1227505
# [157]    1214705    1177834    1120489     883125     848016     794683     757074     744768     708427     668225     661807     573003     571890
# [170]     516100     507160     503302     491989     408333     401890     394999     321115     313312     311058     294935     286705     256275
# [183]     224564     193161     179506     161557     142180     109666     108419     106836     106113     105916     103869     100743      94161
# [196]      89188      87884      84825      84655      72969      68679      67242      67182      65068      57670      51384      50314      49267
# [209]      46050      44819      37429      35236      31817      30615      30539      28956      25383      20956      15700      15700      15398
# [222]      15094      11124      10544       9322       7700       7367       5888       5140       3140       2169       2019       1402       1384
# [235]       1311        832        596         48

Country_Code <- c()
for(i in 1:CIA_Factbook_Population_Size) {
  Country_Code[i] = xmlGetAttr(node=CIA_Factbook_Population[[1]][[i]], name="country")
  Country_Code = toupper(Country_Code[!is.na(Country_Code)])
}
Country_Code
#   [1] "CH" "IN" "US" "ID" "BR" "PK" "BG" "NI" "RS" "JA" "MX" "RP" "ET" "VM" "EG" "GM" "TU" "IR" "CG" "TH" "FR" "UK" "IT" "BM" "SF" "KS" "SP" "UP"
#  [29] "SU" "CO" "TZ" "AR" "KE" "PL" "AG" "UG" "CA" "MO" "IZ" "AF" "NP" "PE" "MY" "UZ" "VE" "SA" "GH" "KN" "YM" "TW" "MZ" "SY" "MA" "RO" "AS" "IV"
#  [57] "CE" "CM" "CI" "NL" "UV" "NG" "MI" "KZ" "EC" "CB" "ML" "ZA" "GT" "AO" "SG" "ZI" "RW" "CU" "PO" "GR" "CD" "TS" "GV" "BE" "BY" "EZ" "BL" "HU"
#  [85] "DR" "SO" "HA" "BO" "BN" "SW" "AJ" "OD" "AU" "HO" "SZ" "TI" "IS" "RI" "HK" "BU" "TO" "LY" "JO" "LA" "PA" "PP" "ES" "ER" "NU" "KG" "DA" "LO"
# [113] "SL" "FI" "AE" "TX" "CT" "SN" "NO" "EI" "BK" "GG" "CS" "HR" "MD" "NZ" "CF" "LE" "RQ" "LI" "LH" "PM" "UY" "MR" "MG" "MU" "AL" "AM" "JM" "KU"
# [141] "WE" "LG" "WA" "MK" "BC" "SI" "LT" "KV" "GA" "GZ" "PU" "GB" "WZ" "MP" "EN" "TD" "BA" "TT" "CY" "FJ" "QA" "CN" "DJ" "GY" "BT" "EK" "MJ" "MC"
# [169] "BP" "CV" "WI" "LU" "NS" "MT" "BX" "MV" "BH" "BF" "IC" "FP" "BB" "NC" "NH" "WS" "TP" "ST" "CC" "VQ" "GJ" "FM" "AA" "TN" "VC" "KR" "JE" "SE"
# [197] "AC" "AN" "IM" "DO" "BD" "AQ" "RM" "GK" "GL" "CJ" "SC" "FO" "CQ" "TK" "SK" "LS" "SM" "RN" "MN" "GI" "VI" "PS" "DX" "AX" "WF" "AV" "CW" "TV"
# [225] "NR" "SH" "TB" "SB" "MH" "FK" "NF" "SV" "KT" "TL" "NE" "VT" "CK" "PC"

Pop <- data.frame("Population" = Population, "CIA.Codes" = Country_Code)
dim(Pop) # [1] 238   2
head(Pop)
#   Population CIA.Codes
# 1 1336718015        CH
# 2 1189172906        IN
# 3  313232044        US
# 4  245613043        ID
# 5  203429773        BR
# 6  187342721        PK

### Merge the two data frames to create a data frame called IMPop with 3 columns:
### IM, Pop, and CIA.Codes

IMPop <- merge(x=IM, y=Pop, by=intersect(names(IM), names(Pop)))
dim(IMPop) # [1] 221   3
head(IMPop)
#   CIA.Codes Infant.Mortality Population
# 1        AA            12.92     106113
# 2        AC            14.63      87884
# 3        AE            11.94    5148664
# 4        AF           149.20   29835392
# 5        AG            25.81   34994937
# 6        AJ            51.08    8372373

### Now merge IMPop with LatLon (from HW8.rda) to create a data frame called AllData that has 6 columns
### for Latitude, Longitude, CIA.Codes, Country Name, Population, and Infant Mortality

names(LatLon) # [1] "Country.Name" "CIA.Codes"    "Longitude"    "Latitude" 
AllData <- merge(x=IMPop, y=LatLon, by=intersect(names(IMPop), names(LatLon)))
dim(AllData) # [1] 202   6
head(AllData)
#   CIA.Codes Infant.Mortality Population         Country.Name Longitude Latitude
# 1        AA            12.92     106113                ARUBA     12.50 -69.9667
# 2        AC            14.63      87884  ANTIGUA AND BARBUDA     17.05 -61.8000
# 3        AE            11.94    5148664 UNITED ARAB EMIRATES     24.00  54.0000
# 4        AF           149.20   29835392          AFGHANISTAN     33.00  65.0000
# 5        AG            25.81   34994937              ALGERIA     28.00   3.0000
# 6        AJ            51.08    8372373           AZERBAIJAN     40.50  47.5000


##################################
### Part 2.  Create a KML document
##################################

### Make the KML document described in HW8.pdf.  It should have the basic
### structure shown in that document.  You can use the addPlacemark function below to make
### the Placemark nodes, you just need to complete the line for the Point node and
### figure out how to use the function.

### This code creates the template KML document 
makeBaseDocument = function() {
  My_XML_Doc = newXMLDoc()
  My_Root = newXMLNode("kml", doc = My_XML_Doc)
  My_Document_Node = newXMLNode("Document", parent = My_Root)
  LookAt_Node = newXMLNode("LookAt", parent = My_Root)
  newXMLNode(name="name", "CIA Fact Book", parent = My_Document_Node)
  newXMLNode(name="description", "Infant mortality", parent = My_Document_Node)
  return(My_XML_Doc)
}

My_KLM_Doc <- makeBaseDocument()
My_KLM_Root <- xmlRoot(My_KLM_Doc)
My_KLM_Children <- xmlChildren(My_KLM_Doc)
My_Document_Node <- My_KLM_Children[[1]][[1]]
My_LookAt_Node <- My_KLM_Children[[1]][[2]]

My_KLM_Doc
#  <?xml version="1.0"?>
#  <kml>
#    <Document>
#      <name>CIA Fact Book</name>
#      <description>Infant mortality</description>
#    </Document>
#    <LookAt/>
#  </kml>


addPlacemark = function(lat, lon, ctryCode, ctryName, pop, infM, parent, inf1, pop1, style = FALSE) {
  pm = newXMLNode("Placemark", newXMLNode("name", ctryName), attrs = c(id = ctryCode), parent = parent)
  newXMLNode("description", paste(ctryName, "\n Population: ", pop, "\n Infant Mortality: ", infM, sep =""), parent = pm)
  coors=newXMLNode("Point", newXMLNode("coordinates", paste(lat, ", ", lon, ", ", 0, sep="")), parent=pm)
### You need to fill in the code for making the Point node above, including coordinates.
### The line below won't work until you've run the code for the next section to set up the styles.
  if(style) newXMLNode("styleUrl", paste("#YOR", inf1, "-", pop1, sep = ""), parent = pm)
}

for(i in 1:(dim(AllData)[1])) {
  addPlacemark(lat=AllData$Latitude[[i]], lon=AllData$Longitude[[i]], ctryCode=AllData$CIA.Codes[[i]], ctryName=AllData$Country.Name[[i]], 
               pop=AllData$Population[[i]], infM=AllData$Infant.Mortality[[i]], parent=My_Document_Node)
}

My_KLM_Doc

### Save your KML document here, call it Part2.kml, and open it in Google Earth.
### (You will need to install Google Earth.)  
### It should have pushpins for all the countries.
setwd("~/Desktop/Homework 8")
saveXML(doc=My_KLM_Doc, file="Part2.kml")


##################################
### Part 3.  Add Style to your KML
##################################

### Now you are going to make the visualizatiion a bit fancier.  Pretty much all the code is given to you
### below to create style elements that are to be placed near the top of the document.
### These, you just need to figure out what it all does.

### Start fresh with a new KML document, by calling makeBaseDocument()
My_KLM_Doc2 = makeBaseDocument()
My_KLM_Root2 <- xmlRoot(My_KLM_Doc2)
My_KLM_Children2 <- xmlChildren(My_KLM_Doc2)
My_Document_Node2 <- My_KLM_Children2[[1]][[1]]
My_LookAt_Node2 <- My_KLM_Children2[[1]][[2]]

My_KLM_Doc2
#  <?xml version="1.0"?>
#  <kml>
#    <Document>
#      <name>CIA Fact Book</name>
#      <description>Infant mortality</description>
#    </Document>
#    <LookAt/>
#  </kml>

### The following code is an example of how to create cut points for different categories of infant mortality and population size.
### Figure out what cut points you want to use and modify the code to create these categories.
infCut = cut(AllData$Infant.Mortality, breaks = c(0, 10, 25, 50, 75, 200))
infCut = as.numeric(infCut)
popCut = cut(log(AllData$Population), breaks = 5)
popCut = as.numeric(popCut)

### Now figure out how to add styles and placemarks to doc2
### You'll want to use the addPlacemark function with style = TRUE
### Below is code to make style nodes. You should not need to do much to it.

### You do want to figure out what scales to you for the sizes of your circles
scales = c(0.2, 1, 2.5, 3.5, 4.5)

addStyle = function(j, k, parent, urlBase, scales = scales) {
  colors_from_website = c("blue", "green", "yellow", "orange", "red")
  colors_from_website_matched_j = colors_from_website[j]
  st = newXMLNode("Style", attrs = c("id" = paste("YOR", j, "-", k, sep="")), parent = My_Document_Node2)
  icon_style = newXMLNode("IconStyle", parent=st)
  newXMLNode("scale", scales[k], parent=icon_style)
  newXMLNode("Icon", paste(urlBase, "color_label_circle_", colors_from_website_matched_j, ".png", sep =""), parent = icon_style)
}

for (k in 1:5) {
  for (j in 1:5) {
    addStyle(j, k, My_Document_Node, 'http://www.stanford.edu/~vcs/StatData/circles/', scales)
  }
}

My_KLM_Doc2

### You will need to figure out what order to call addStyle() and addPlacemark() so that the tree is built properly. 
### You may need to adjust the code to call the png files

for(i in 1:(dim(AllData)[1])) {
  addPlacemark(lat=AllData$Latitude[[i]], lon=AllData$Longitude[[i]], ctryCode=AllData$CIA.Codes[[i]], ctryName=AllData$Country.Name[[i]], 
               pop=AllData$Population[[i]], infM=AllData$Infant.Mortality[[i]], parent=My_Document_Node2, inf1=infCut[[i]], pop1=popCut[[i]], 
               style=TRUE)
}
My_KLM_Doc2

### Finally, save your KML document, call it Part3.kml and open it in Google Earth to 
### verify that it works.  For this assignment, you only need to submit your code, 
### nothing else.  You can assume that the grader has already loaded HW6.rda.
setwd("~/Desktop/Homework 8")
saveXML(doc=My_KLM_Doc2, file="Part3.kml")
