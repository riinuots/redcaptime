library(shiny)
library(plotly)

shinyUI(fluidPage(

  # Application title
  titlePanel("Data collection timeline"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput('dag',
                    label = 'Select a hospital:',
                    choices = paste0('Hospital ', 1:6),
                    selected = paste0('Hospital ', 1:6))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Timeline", plotOutput("timeplot", height = 600), plotOutput("joyplot", height = 600)), 
                  tabPanel("Hover", plotlyOutput("timeplotly", height = 600)), 
                  tabPanel('Info', h4( a("https://github.com/riinuots/redcaptime", href="https://github.com/riinuots/redcaptime") ))
      )
    )
  )
))
