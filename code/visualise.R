library(tidyverse)
library(lingtypology)
setwd("/home/agricolamz/for_work/HSE/students/2017_b4_Kartozia/data/")
df <- read_tsv("allvillages_v2.tsv")

df %>% 
  filter(dialect != "") %>% 
  rowwise() %>% 
  mutate(dialect_group = first(unlist(str_split(dialect, pattern = ","))))->
  df_filtered

map.feature(languages = df_filtered$Language,
            latitude = df_filtered$Lat,
            longitude = df_filtered$Lon,
            features = df_filtered$dialect_group,
            label = paste(df_filtered$Language, df_filtered$dialect),
            popup = df_filtered$EngNames,
            legend = FALSE)
