# Yapılacaklar
#Oyuncu benzerliklerinin bulunması için uzaklık (distance) matrisinin bulunması
#Bu analiz için veri setinin hazırlanması
#Matris oluşturulduktan sonra örnek bir futbolcu için benzer oyuncuların bulunması
#Oyuncu karşılaştırmaları

#1.Kütüphaneler
library(tidyverse)
library(DataExplorer)
library(factoextra)
library(plotly)

#2.Veri Kaynağı
#Kaggle
# https://www.kaggle.com/stefanoleone992/fifa-22-complete-player-dataset?select=players_22.csv

#Veri Yükleme
df<-read.csv("players_22.csv",stringsAsFactors = FALSE)

#Veri boyutu:Gözlem sayısı tekil oyuncu sayısıdır aynı zamanda
dim(df)

#Örnek Futbolcu
df%>%filter(short_name=="L.Messi")%>% view

#3.Veri Ön İşleme
df<-df%>% filter(player_positions !="GK",overall>=70)
dim(df)

#4.Distance Matrix - Uzaklık matrisinin hesaplanması

#5.Analiz Çıktıları

#6.Aday oyuncu ve benzerlerinin kıyası

