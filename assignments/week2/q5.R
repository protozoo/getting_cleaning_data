dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for";
dataFile <- "./data/fwf.for";

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

ds <- read.fwf( file=dataFile, widths=c( -1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4 ), skip=4 )
sum( ds[,4] )