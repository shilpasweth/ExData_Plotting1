if(!require('sqldf'))     #checks if package is installed, if not it gets installed
{
  install.packages('sqldf')
}

library(sqldf)

loadTable <- function()     #loads the information from the website and stores as a table in working directory
{   
  downloadTable <- function(url, zipFile)     #checks if zip file exists, else it downloads zip file
  {    
    if(!file.exists(zipFile))
    {      
      tryCatch(
        download.file(url, destfile=zipFile)
        , error = function(e){
          download.file(url, destfile=zipFile, method='wget')
        }
      )
    }
  }  
  extractFile <- function(file, zipFile)     #checks if file is unzipped, else unzips file 
  {
    if(!file.exists(file)) 
    {
      unzip(zipFile, files=file)
    }
  }  
  prepareTable <- function()     #turns the informaton into a table of desired format
  {
    url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    targetFile <- 'household_power_consumption.txt'
    zipFile <- 'exdata-data-household_power_consumption.zip'    
    downloadTable(url, zipFile)
    extractFile(targetFile, zipFile)    
    cols <- c("character", "character", rep("numeric", 7))    
    sql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"    
    d <- read.csv.sql(targetFile, sql, sep=';'
                      ,colClasses=cols
                      ,header=T)    
    dateTime <- paste(d$Date, d$Time, sep=' ')
    dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")   
    d$DateTime <- dateTime    
    d
  }  
  prepareTable()
}

getTable <- function()     #checks if table is already loaded, else it loads table
{
  if(!exists('loadedTable'))
  {
    loadedTable <<- loadTable()
  }  
  loadedTable
}

if(!exists('disablePlottingToFile'))     #render flag for plot 4 to disable plotting of plots 2 and 3
  disablePlottingToFile <- F