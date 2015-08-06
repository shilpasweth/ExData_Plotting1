source('begin.R')

plot2 <- function(pngDevice, ylab='Global Active Power (kilowatts)')
{
  print('Open exdataplots folder to view file')  
  table <- getTable()   
  if(pngDevice)
  {
    dir.create('exdataplots', showWarnings='F')
    png('exdataplots/plot2.png', width=480, height=480, bg='transparent')
  }    
  with(table, 
      {
        plot(DateTime, Global_active_power, type='l', xlab='', ylab=ylab)
      }
  )    
  if(pngDevice)
  {
    dev.off()
  }
}

if(!disablePlottingToFile)
{
  plot2(T)
}