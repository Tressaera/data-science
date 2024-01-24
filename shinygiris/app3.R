library(shiny)
library(tidyverse)
ui <- fluidPage(
  titlePanel("Dinamik Input ve Output Oluşturma/Observe Olayı"),
  hr(),
  #1
  selectInput("gear","Gear:",choices=sort(unique(mtcars$gear))),
  #2.
  selectInput("carb","Carb:",choices=sort(unique(mtcars$carb))),
  #3
  selectInput("carb","Carb:",choices=NULL),
  
  tableOutput("table")
)

server <- function(input, output,session) {
  output$table<-renderTable({
    
    #1.
    mtcars
    #2.
    mtcars%>%filter(gear==input$gear)
    #3.
    mtcars%>%filter(gear==input$gear,carb==input$carb)
    })
  
  observe({
    temp <- mtcars %>%
      filter(gear == input$gear) %>%
      pull(carb) %>%
      unique() %>%
      sort()
    
    updateSelectInput(session, "carb", choices = temp, selected = temp[1])
  })
  observeEvent(input$gear,{
    temp <- mtcars %>%
      filter(gear == input$gear) %>%
      pull(carb) %>%
      unique() %>%
      sort()
    
    updateSelectInput(session, "carb", choices = temp, selected = temp[1]) 
  })
}

shinyApp(ui = ui, server = server)