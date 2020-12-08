ui <- fluidPage(
  
  titlePanel("Students rate importance of internet access vs. reducing pollution"),
  
  sidebarLayout(
    sidebarPanel(
      selectorsGoButtonInput(id = "selectors_go")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel(
          title = "Histograms",
          fluidRow(
            column(6, histogramOutput(id = "internet_access")),
            column(6, histogramOutput(id = "reducing_pollution"))
          )
        ), 
        tabPanel(
          title = "Data",
          tableOutput(id = "table") 
        ),
        tabPanel(
          title = "Scatter",
          scatterOutput(id = "scatter")
        )
        
      )
    )
  )
)
