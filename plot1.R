source('begin.R')

plot1 <- function()
{
  print('Open exdataplots folder to view file')  
  table <- getTable()  
  dir.create('exdataplots', showWarnings='F')  
  png('exdataplots/plot1.png', width=480, height=480, bg='transparent')
  hist(table$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", col='red')
  dev.off()
}

plot1()