library(shiny)

ui <- fluidPage(
  
  titlePanel("Sayfa Tasarımı ve Paneller"),
  h4("Satır / Sütun oluşturma", style = "color:red;"),
  hr(),
  
  # 1. Satır
  fluidRow(
    
    h4("1. satır")
    
  ),
  
  # 2. Satır
  fluidRow(
    
    h4("2.satır")
  ),
  
  hr(),
  
  # Sütun Oluşturma
  column(
    width = 12,
    
    column(width = 6, h4("1. sütun")),
    column(width = 6, h4("2. sütun"))
    
  ),
  
  
  hr(),
  
  # Satır içerisinde sütun oluşturma
  fluidRow(
    
    column(width = 4, h4("1. sütun")),
    column(width = 4, h4("2. sütun")),
    column(width = 4, h4("3. sütun"))
  )
  
  
  
  
  
  
  
)

server <- function(input, output, session) {
  
  
  output$plot <- renderPlot({
    
    plot(1:2000)
    
  })
  
}

shinyApp(ui = ui, server = server)