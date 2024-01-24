tabPanel("Transfer List",
         
         fluidRow(
           
           wellPanel(
             
             fluidRow(
               
               column(width = 5,
                      
                      
                      sliderInput("tl_value", "Value Range:", min=0, max=100000000, value=c(0,100000000),step=1),
                      
                      sliderInput("tl_age", label = "Age Range:",min = 15, max = 45, value = c(26,30)),
                      
                      sliderInput("tl_overall", label = "Overall Range:", min = 0, max = 100, value = c(0,100))
                      
                      
               ),
               
               
               
               column(width = 2),
               
               
               
               column(width = 5,
                      
                      
                      numericInput("tl_contract", label = "Contract Valid Until:", value = 2023, step = 1, width = 250),
                      
                      pickerInput(inputId = "tl_foot", label = "Preferred Foot:", 
                                  choices =  c("Left", "Right"), selected = c("Left", "Right"),multiple = T, width = 250),
                      
                      pickerInput(inputId = "tl_league", label = "League:", 
                                  choices =  NULL, selected = NULL,multiple = T, width = 250),
                      
                      
                      pickerInput(inputId = "tl_position", label = "Position:", 
                                  choices =  NULL, selected = NULL, multiple = T, width = 250)
                      
                      
                      
                      
               )
               
               
             )
             
             
             
             
           )
           
           
         ),
         
         
         fluidRow(
           
           
           column(width = 12,
                  
                  div(downloadButton("download", "Download Data", style = "background-color:seagreen; color: white;"),style = "text-align:center"),
                  hr(),
                  
                  dataTableOutput("transferdt"),
                  # Nümerik input slider için
                  tags$style(type = "text/css",".noUi-connect {background: #f5971d;}"),
                  # DT sütun renk ayarı
                  tags$head(tags$style("#transferdt thead th{background-color: #f5971d; color: #231f20;}")),
                  # Satır Sütun çizgileri
                  tags$head(tags$style("#transferdt tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}")),
                  
           )
           
           
           
           
         )
         
         
         
         
         
)