histogramOutput <- function(id) {
  
  ns <- NS(id)
  plotOutput(outputId = ns("histo"))
  
}

histogramServer <- function(id, var, data) {
  
  moduleServer(
    
    id = id,
    module = function(input, output, session) {
      output$histo <- renderPlot({
        ggplot(data()) +
          aes(x = .data[[var]]) +
          geom_histogram(fill = "steelblue", col = "white", alpha = 0.6, bins = 30)
      })
    }
    
  )
  
}