library(shiny)

ui <- fluidPage(
  
  titlePanel("Sayfa Tasarımı ve Paneller"),
  h4("Tabsetpanel oluşturma", style = "color:red;"),
  hr(),
  
  
  # Tabset Panel
  tabsetPanel(
    
    type = "pills", # tabs / pills
    
    
    tabPanel("Sayfa1",
             
             selectInput("inp1", label = "", choices = 1:5)
             
    ),
    
    tabPanel("Sayfa2", 
             
             numericInput("inp2", label = "", 
                          value = 30, min = 0, max = 100)
    ),
    tabPanel("Sayfa3",
             
             plotOutput("plot")
             
             
    )
    
    
  )
  
  
)

server <- function(input, output, session) {
  
  
  output$plot <- renderPlot({
    
    plot(1:2000)
    
  })
  
}

shinyApp(ui = ui, server = server)