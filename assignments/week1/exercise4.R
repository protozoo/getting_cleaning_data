#install.packages("XML")

library(XML)
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# I downloaded the file manually. otherwise it doesn't recognize it as xml, i don't know why...
dataUrl <- "./data/baltimore_restaurants.xml";

doc <- xmlTreeParse( dataUrl, useInternal=TRUE )
# read a specific region of the excel file

# get the root node
rootNode = xmlRoot(doc)

# find those mathing our needs
results <- xpathSApply( rootNode, "//row[zipcode='21231']", xmlValue)

length( results )
