# 

downloadIfNecessary <- function(fileName, dataLink) {
  if(!file.exists(fileName)) { # skip download if we already have the zip file
    message("downloading data...")
    download.file(dataLink, destfile=fileName, method="curl")
  } 
}

trainingFile <- "pml-training.csv"
downloadIfNecessary(trainingFile, "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv")

testingFile <- "pml-testing.csv"
downloadIfNecessary(testingFile, "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv")

if(!exists("trainingData")) {
  trainingData <<- read.csv(trainingFile)  
}

if(!exists("testingData")) {
  testingData <<- read.csv(testingFile)  
}
