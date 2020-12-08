scatterOutput <- function(id) {
  
  ns <- NS(id)
  plotOutput(outputId = ns("scatter"))
  
}

scatterServer <- function(id, var_x, var_y, data) {
  
  moduleServer(
    
    id = id,
    module = function(input, output, session) {
      output$scatter <- renderPlot({
        ggplot(data()) +
          aes(x = .data[[var_x]], y = .data[[var_y]]) +
          geom_point(alpha = 0.6)
      })
    }
    
  )
  
}