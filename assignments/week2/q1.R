library(jsonlite)

# donwload the dataset and convert it to a data frame
ds <- fromJSON("https://api.github.com/users/jtleek/repos")

# find the one we want, based on its name
s <- subset( ds, name=="datasharing")

# find the property we want
s$created_at
