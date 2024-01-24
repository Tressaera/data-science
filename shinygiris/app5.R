library(shiny)

ui <- fluidPage(
  
  titlePanel("Reactive"),
  hr(),
  
  # 1. reactive()
  # 2. reactiveVal()
  # 3. reactiveValues()
  
  tabsetPanel(
    
    # 1. Reactive
    tabPanel("1. Reactive",
             br(),
             
             tableOutput("table")
             
    ),
    
    
    tabPanel("2. Reactive Bonus",
             br(),
             
             fileInput("file1", "Choose CSV File", accept = ".csv"),
             tableOutput("tablebonus")
             
    ),
    
    # 2. Reactive Value
    tabPanel("3. Reactive Value",
             br(),
             
             actionButton("minus", "-1"),
             actionButton("plus", "+1"),
             br(),
             textOutput("value")
             
    ),
    
    # 3. Reactive Values
    tabPanel("4. Reactive Values",
             br(),
             
             actionButton("minus2", "-1"),
             actionButton("plus2", "+1"),
             br(),
             textOutput("value2")
             
             
    ),
    
    
    # 4. Bonus
    tabPanel("5. Bonus",
             br(),
             
             tableOutput("table2")
             
    )
    
  )
  
  
  
  
  
)

server <- function(input, output, session) {
  
  # 1. reactive()
  
  rv_df <- reactive({
    
    mtcars %>% 
      group_by(gear) %>% 
      count()
    
  })
  
  output$table <- renderTable({
    
    # Statik
    # mtcars %>% 
    #   group_by(gear) %>% 
    #   count()
    
    # Reactive
    rv_df()
    
  })
  
  
  # 2. reactive() Bonus
  
  df <- reactive({
    
    
    read.csv(input$file1$datapath)
    
  })
  
  
  output$tablebonus <- renderTable({
    
    df()
    
  })
  
  
  # 3. reactiveVal()
  value <- reactiveVal(value = 0)
  
  observeEvent(input$plus, {
    
    newValue <- value() + 1
    
    value(newValue)
    
  })
  
  observeEvent(input$minus, {
    
    newValue <- value() - 1
    
    value(newValue)
    
  })
  
  output$value <- renderText({
    
    value()
    
  })
  
  
  # 4. reactiveValues()
  rv <- reactiveValues(value = 0, sayi = NULL, saddfsf = NULL)
  
  
  observeEvent(input$plus2, {
    
    newValue <- rv$value + 1
    
    rv$value <- newValue
    
  })
  
  observeEvent(input$minus2, {
    
    newValue <- rv$value - 1
    
    rv$value <- newValue
    
  })
  
  output$value2 <- renderText({
    
    rv$value
    
  })
  
  
  # 5. Bonus
  
  output$table2 <- renderTable({
    
    
    rv_df() %>% 
      mutate(n = n * rv$value) #value()
    
    
    
    
    
  })
  
  
  
}

shinyApp(ui = ui, server = server)