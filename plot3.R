source('begin.R')

plot3 <- function(pngDevice)
{
  print('Open exdataplots folder to view file')  
  table <- getTable()  
  if(pngDevice)
  {
    dir.create('exdataplots', showWarnings='F')
    png('exdataplots/plot3.png', width=480, height=480, bg='transparent')
  }  
  with(table, 
      {
        plot(DateTime, Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type='l', col='red')
        lines(DateTime, Sub_metering_3, type='l', col='blue')
      }
  )  
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))
  if(pngDevice)
  {
    dev.off()
  }
}

if(!disablePlottingToFile)
{
  plot3(T)
}
