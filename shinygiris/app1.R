library(shiny)
ui <- fluidPage(
  
  titlePanel("input oluşturma"), 
  hr(),
  h3("Select Input" , style="color:red;" ),
  selectInput(inputId = "select" , label ="Select",
              choices = c("İstanbul", "Kocaeli" , "Bursa" ),
              selected ="Kocaeli" , width=300),
  
  selectInput(inputId="select2" , label ="Select",
              choices=c("Istanbul" , "Kocaeli" , "Bursa" ),
              selected= "Kocaeli" , width=300, multiple=TRUE),
  
  h3("Text Input" , style= "color:red;" ), 
  textInput(inputId= "text" , label="Metin" ,
            value="Tarkan Geççek" , width=200),
  
  h3("Text Area Input", style="color:red;"),
  textAreaInput(inputId="textarea", label=" Şarkı sözü",
                value= "Buralara yaz günü kar yağıyor canım \nölene kadar seni bekleyemem",
                width=400, height=200
  ),
  
h3("File Input", style="color:red;"),
fileInput(inputId="file", label = "Yüklemek istediğiniz dosyayı seçiniz"),

h3("Slider Input", style="color:red;"),
sliderInput(inputId = "slider", label = "Slider", min = 0, max=100, value=40
),

h3("Numeric Input", style="color:red;"),
numericInput(inputId="numeric", label="Sayi", value = 3),

h3("Date Input", style="color:red;"),
dateInput(inputId="date", label="Tarih", value=Sys.Date()),

h3("Date Range Input", style="color:red;"),
dateRangeInput(inputId="daterange", 
label="Tarih aralığı", start="1990/01/01", end="2024/01/01"
),
h3("Radio Buttons", style="color:red;"),
radioButtons(inputId ="radio", label="renkler",
choices=c("Kırmızı","Mavi","Yeşil"),selected="Mavi"),



h3("Checkbox Input", style="color:red;"),
checkboxInput("checkbox", "checkbox", value=TRUE),

h3("Checkboxgroup Input", style="color:red;"),
checkboxGroupInput("checkboxgroup", "checkboxgroup",
                   choices=c("Kırmızı", "Mavi", "Yeşil"),
                   selected=c("Kırmzızı","Yeşil")),

h3("Action Button", style="color=red;"),
actionButton(inputId="action",label="Select",icon=icon("plane"))
)
server <- function(input, output) {}
shinyApp(ui = ui, server = server)