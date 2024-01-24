#1.Kütüphaneler

source("library.R")

#2.Global
source("global.R")

library(shiny)

ui<-fluidPage(
  #1.CSS  
  tags$head(
    tags$link(rel="stylesheet", type="text/css", href="new_project.css")
  ),
  #2.Javascript  
  tags$head(
    tags$link(type="text/javascript", src="new_project.js")
  ),
  #3.Navbar
  navbarPage(
  title = tagList(
  tags$img(src="Westham_logo.png",
  width=30, style="margin-top:-10px; display:inline;"),
  h3("West Ham F.C",style="display:inline;")
  ),
  source("ui/data.R",local=TRUE, encoding="UTF-8")$value,
  source("ui/scouting.R",local=TRUE, encoding="UTF-8")$value,
  source("ui/transferlist.R",local=TRUE, encoding="UTF-8")$value
  )
)

server<-function(input,output,session){
  source(file.path("server","reactiveData.R"),local=TRUE, encoding="UTF-8")$value
  source(file.path("server","data.R"),local=TRUE, encoding="UTF-8")$value
  source(file.path("server","scouting.R"),local=TRUE, encoding="UTF-8")$value
  source(file.path("server","transferlist.R"),local=TRUE, encoding="UTF-8")$value
}
  
shinyApp(ui=ui, server=server)