library(shiny)

ui<-fluidPage(
  titlePanel("Observe Event"),
  hr(),
  
  #Text Input
  textInput("text","metin giriniz:",value=""),  
  #Action Button
  actionButton("action","Yazdır"),
  #Text Output
  verbatimTextOutput("textoutput")
)

server<-function(input,output,session){
  observeEvent(input$action,{
  output$textOutput<-renderPrint({
    input$text
  })
})
} 

shinyApp(ui=ui,server=server)