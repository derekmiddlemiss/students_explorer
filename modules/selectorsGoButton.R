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
    sliderInput(
      ns("age"),
      label = "Age:",
      min = 10,
      max = 18,
      value = c(10, 18),
      step = 1
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
          #browser()
          students_big %>%
            filter(gender == input$gender) %>%
            filter(region == input$region) %>%
            filter(between(ageyears, input$age[1], input$age[2])) %>%
            select(
              region,
              gender,
              ageyears,
              importance_internet_access,
              importance_reducing_pollution
            )
        },
        ignoreNULL = FALSE         
      )

    }
  
  )

}