output$player_database <- renderDataTable({
  
  ##Hyperlink
  hyperlink <- c(
    "function(data, type, row) {",
    "  if (type === 'display') {",
    #row[0]: 1. değişkende URL olduğunu söyler. URL değişkeni neredeyse indeksi ona göre ayarlamak lazım.",
    "    var a = '<a href=\"' + row[2] + '\">' + data + '</a>';",
    "    return a;",
    "  } else {",
    "    return data;",
    "  }",
    "}"
  )
  
  
  temp <- database() %>%
  mutate(
  player_face_url = paste0('<center><img src="', player_face_url, '"height=60"></img></center>'),
  nation_flag_url = paste0('<center><img src="', nation_flag_url, '"height=60"></img></center>'),
  club_logo_url = paste0('<center><img src="', club_logo_url, '"height=60"></img></center>'),
  club_flag_url = paste0('<center><img src="', club_flag_url, '"height=60"></img></center>')
)%>%
rename_all(., list(~str_remove_all(str_to_title(gsub("[[:punct:]]", " ", .)),"Url")))
  
datatable(temp,
          escape=FALSE, #htmller için 
          
          options=list(
            scrollX=TRUE,
            
       #Hyperlink: targets indeksi 0'dan başlar
       colunmnDefs=list(
         list(targets=3, render=JS(hyperlink),searchable=T),
         list(targets=2, visible=FALSE)
       )
          )
)
})



output$player_distance <- renderDataTable({
  datatable(distance()%>%
              select(ID:CLUB2, value) %>%
              rename("DISTANCE"="value"),
            filter="top",
            class="display nowrap compact",
            options = list(scrollX=TRUE,
                           searching =TRUE)
              )
})