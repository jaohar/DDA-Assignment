library(shiny)  
 
shinyUI(pageWithSidebar( 
  
  headerPanel("Consequences of Environmental Effects"), 
  
  sidebarPanel(
    
    selectInput(inputId = "comboBox",
                label = "Choose type of consequence:",
                choices = list("Human Fatalities" = "HF",
                               "Human Injuries" = "HI",
                               "Property Damage" = "PD"))
  ),
  
  mainPanel( 
    h3("United States (1980 - 2011)"),
    plotOutput("conq_plot")
  )
))