library(shiny)


ui <- fluidPage(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "miuulcss.css")
  ),

  navbarPage("Miuul, HTML-CSS",
             
             
             tabPanel("Sayfa1", 
                      
                      # Paragraf yazma 
                      tags$p("sayfa 1"),
                      p("sayfa 1"),
                      HTML("<p>sayfa 1</p>")
                     
                      
             ),
             
             
             
             
             tabPanel("Sayfa2", 
                      
                      # Resim Ekleme
                      

                      column(width = 6,
                             
                             
                             tags$img(src = "miuul.jpeg", width = 100)
                             
                      ),
                      
                      
                      column(width = 6,
                             
                             
                             HTML("<img src = 'https://www.kindpng.com/picc/m/706-7068650_r-shiny-logo-png-transparent-png.png' width='100px'")
                             
                                                    
                      )
                      
                      
                      
                      
                      
             )
             
             
  )
  
  
)


server <- function(input, output) {
  
  
}


shinyApp(ui = ui, server = server)
