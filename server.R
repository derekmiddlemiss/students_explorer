library(ggplot2)
library(dplyr)

server <- function(input, output) {
  
  filtered_data <- selectorsGoButtonServer("selectors_go")
  
  histogramServer(
    id = "internet_access", 
    var = "importance_internet_access",
    data = filtered_data
  )
  
  histogramServer(
    id = "reducing_pollution", 
    var = "importance_reducing_pollution",
    data = filtered_data
  )
  
  tableServer(
    id = "table",
    data = filtered_data
  )
  
}