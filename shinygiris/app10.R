library(shiny)
library(tidyverse)


ui <- fluidPage(
  
  titlePanel("Sayfa Tasarımı ve Paneller"),
  h4("Satır / Sütun oluşturma", style = "color:red;"),
  hr(),
  
  # 1. Satır
  fluidRow(
    
    h4("1.satır"),
    tableOutput("table")
    
  ),
  
  # 2. Satır İçerisinde 2 sütun bulunduruyor
  fluidRow(
    h4("2.satır"),
    
    column(width = 6, h4("1. sütun"), 
           plotOutput("plot1")),
    
    column(width = 6, h4("2. sütun"),
           plotOutput("plot2"))
    
  )
  
  
)

server <- function(input, output, session) {
  
  output$table <- renderTable({
    
    head(iris, 10)
    
  })
  
  output$plot1 <- renderPlot({
    
    plot(1:2000)
    
  })
  
  
  output$plot2 <- renderPlot({
    
    ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species))+
      geom_point()
    
  })
  
}

shinyApp(ui = ui, server = server)