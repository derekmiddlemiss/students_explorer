tableOutput <- function(id) {
  
  ns <- NS(id)
  dataTableOutput(outputId = ns("table"))
  
}

tableServer <- function(id, data) {
  moduleServer(
    
    id = id,
    module = function(input, output, session) {
      output$table <- renderDataTable({
        data()
      })
        
    }
    
    
  )
}