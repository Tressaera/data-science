library(shiny)
library(tidyverse)
library(DT)

ui <- fluidPage(
  titlePanel("Output Oluşturma"),
  #Output Tipleri
  #1. Table
  tableOutput("table1"),
  #2. Datatable
  dataTableOutput("datatable1"),
  #2. Plot
  plotOutput("plot1"),
  #3. Text
  textOutput("text1"),
  #4. UI, HTML
  uiOutput("ui1")
  #5. Image....
)
server <- function(input, output) {
  output$table1<-renderTable({
    head(mtcars %>% mutate(disp=disp*2),10)
  })
  
  output$datatable1<-renderDataTable({
    datatable(head(mtcars,10))
  })
  
  output$plot1<-renderPlot({
   ggplot(mtcars,aes(disp))+geom_histogram()
  })
  
  output$text1<-renderText({
    print("Bu bir shiny eğitimidir")
  })
  output$ui1<-renderUI({
    h1("Deneme")
  })
}
shinyApp(ui = ui, server = server)