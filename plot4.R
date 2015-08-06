source('begin.R')

plot4 <- function()
{
  print('Open exdataplots folder to view file')  
  table <- getTable()  
  disablePlottingToFile <<- T
  source('plot2.R')
  source('plot3.R')  
  disablePlottingToFile <<- F  
  plotVoltage <- function()
  {
    with(table, 
        {
          plot(DateTime, Voltage, xlab='datetime', type='l')
        }
    )
  }  
  plotGRP <- function()
  {
    with(table, 
        {
          plot(DateTime, Global_reactive_power, xlab='datetime', type='l')
        }
    )
  }      
  dir.create('exdataplots', showWarnings='F')  
  png('exdataplots/plot4.png', width=480, height=480, bg='transparent')  
  par(mfrow=c(2,2))  
  plot2(F, 'Global Active Power')
  plotVoltage()
  plot3(F)
  plotGRP()  
  dev.off()
}

plot4()