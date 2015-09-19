require(data.table)

# Set source url and load it
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
dataFile <- './data/q5_dataset.csv'

# Just download if it has not been so yet
if( !file.exists(dataFile) ){
    download.file(dataUrl, dataFile, method="curl")
}
# read the dataset
DT <- fread( dataFile)

computeAverage1 <- function () {
    for(i in 1:1000) {
        sapply(split(DT$pwgtp15,DT$SEX),mean)
    }    
}

computeAverage2 <- function () {
    for(i in 1:1000) {
        tapply(DT$pwgtp15,DT$SEX,mean)
    }    
}
computeAverage3 <- function () {
    for(i in 1:1000) {
        DT[,mean(pwgtp15),by=SEX]
    }    
}
####

system.time( computeAverage1() )
system.time( computeAverage2() )
system.time( computeAverage3() )




