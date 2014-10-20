setwd("/Users/jonathan/Desktop/Coursera 2014/_DDP Assignment/")
HF <- read.csv("HF.csv")
HI <- read.csv("HI.csv")
PD <- read.csv("PD.csv")

#Limit dates to after 1980
HF <- HF[HF$Year > 1980, ]
HI <- HI[HI$Year > 1980, ]
PD <- PD[PD$Year > 1980, ]

displot <- function(a, b, maxnum) {
  plot(main = paste(b, "due to Environmental Events"),
       x = 1:nrow(a), y = a$RAIN_HAIL, type = "n", xlab = "Number of Years",
       ylab = b, ylim=c(0,maxnum))
       with(a, lines(x = 1:nrow(a), y = RAIN_HAIL, col = "red", lwd=5))
       with(a, lines(x = 1:nrow(a), y = SUMMER_HEAT, col = "navy blue", lwd=5))
       with(a, lines(x = 1:nrow(a), y = TORNADO, col = "green", lwd=5))
       with(a, lines(x = 1:nrow(a), y = WIND_STORM, col = "orange", lwd=5))
       with(a, lines(x = 1:nrow(a), y = WINTER_SNOW, col = "purple", lwd=5))
       legend('topleft', names(a)[-1],
         legend = c("Rail/Hail","Summer/Heat","Tornado","Wind/Storms","Winter/Snow"),
         lty = 1, col = c('red', 'navy blue', 'green',' orange', 'purple'),
         bty='n', cex=1 , lwd=5)
}


library(shiny)
 
shinyServer(function(input, output) { 
  
  output$conq_plot <- renderPlot({
    
    plotchoice <- switch(input$comboBox, 
                   "HF" = list("HF", "Human Fatalities", 120),
                   "HI" = list("HI", "Human Injuries", 500),
                   "PD" = list("PD", "Property Damage($)", 15000)
                   )
    
    do.call(displot, list(as.name(plotchoice[[1]]), plotchoice[[2]], plotchoice[[3]]))
  })

})