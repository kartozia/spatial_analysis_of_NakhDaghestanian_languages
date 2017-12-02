library(dplyr)
library(lingtypology)
setwd("/home/agricolamz/_DATA/OneDrive1/_Work/_Students/2017_b4_Kartozia/data")
df <- read.csv("allvillages_v1.tsv", sep = "\t")

df %>% 
  filter(dialect != "") %>% 
  rowwise() %>% 
  mutate(dialect_group = first(unlist(str_split(dialect, pattern = ","))))->
  df

map.feature(languages = df$Language,
            latitude = df$Lat,
            longitude = df$Lon,
            features = df$dialect_group,
            label = df$dialect,
            popup = df$EngNames,
            legend = FALSE)
