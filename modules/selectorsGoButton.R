selectorsGoButtonInput <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    selectInput(ns("gender"),
                "Choose gender",
                choices = c(Female = "F", Male = "M")
    ),
    selectInput(ns("region"),
                "Choose region",
                choices = unique(students_big$region)
    ),
    actionButton(ns("go"), "Generate plots and table")
  )
}

selectorsGoButtonServer <- function(id) {
  moduleServer(

    id = id,
    module = function(input, output, session) {

      eventReactive(
        eventExpr = input$go, 
        valueExpr = {
          students_big %>%
            filter(gender == input$gender) %>%
            filter(region == input$region) %>%
            select(
              region,
              gender,
              importance_internet_access,
              importance_reducing_pollution
            )
        },
        ignoreNULL = FALSE         
      )

    }
  
  )

}