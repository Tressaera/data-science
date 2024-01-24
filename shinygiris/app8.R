library(shiny)

ui <- fluidPage(
  
  titlePanel("Sayfa Tasarımı ve Paneller"),
  h4("Conditional Panel oluşturma", style = "color:red;"),
  hr(),
  
  
  selectInput("inp1", "Input", choices = c("A", "B", "C", "D"),
              selected = "A"),
  
  conditionalPanel(
    condition = "input.inp1 == 'C'", 
    
    p("Grafik"),
    plotOutput("plot")
    
  )
  
  
  
  
  
)

server <- function(input, output, session) {
  
  
  output$plot <- renderPlot({
    
    plot(1:2000)
    
  })
  
}

shinyApp(ui = ui, server = server)