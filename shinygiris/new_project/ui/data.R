tabPanel("Data",
         
         fluidRow(
         column(width = 12,
                tabsetPanel(
                  type="pills",
                  tabPanel("Database",
                           hr(),
                  dataTableOutput("player_database"),
                  #Nümerik input slider için
                  tags$style(type="text/css",".noUi-connect {background: #7c2c3b;}"),
                  #DT sütun renk ayarı
                  tags$head(tags$style("#player_database thead th{background-color: #7c2c3b; color: #2dafe5;)")),
                  #Satır sütun çizgileri
                  tags$head(tags$style("#player_database tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey; border-right: 0.1px solid grey;}"))
                           ),
                  tabPanel("Distance",
                           hr(),
                  dataTableOutput("player_distance")       
                           )
                )
         )
         )
         )