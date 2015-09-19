# code book url: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv";
dataFile <- "./data/us_properties.csv";

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

#list.files("./data");
data = read.table( dataFile, sep=",", header=TRUE );

head( data );

nrow( subset(data,VAL>=24) )
