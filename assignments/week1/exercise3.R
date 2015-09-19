# install.packages("xlsx")

library(xlsx);


dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx";
dataFile <- "./data/natural_gas.xlsx";

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

# read a specific region of the excel file
dat = read.xlsx( dataFile, sheetIndex=1, header=TRUE, startRow=18, endRow=23, startCol=7, endCol=15 );

# find result
sum(dat$Zip*dat$Ext,na.rm=T) 

