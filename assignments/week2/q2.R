library(sqldf)
library(RMySQL)

# this is needed to avoid error messages
options(sqldf.driver = "SQLite") # as per FAQ #7 force SQLite
options(gsubfn.engine = "R") # as per FAQ #5 use R code rather than tcltk

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv";
dataFile <- "./data/american_survey";

# make sure the data direcory exists
if( !file.exists("./data") ){
    dir.create("data");
}
# Set the Working directory to "data"
# setwd("./data");

# download the data file
if( !file.exists( dataFile ) ){
    download.file( dataUrl, destfile=dataFile, method="curl");
}

# donwload the dataset and convert it to a data frame
acs <- read.table( dataFile, sep=",", header=TRUE );

# get the requested data
sqldf("select pwgtp1 from acs where AGEP < 50")

