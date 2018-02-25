library(tidyverse)
library(lingtypology)
df <- read_tsv("https://raw.githubusercontent.com/kartozia/spatial_analysis_of_NakhDaghestanian_languages/master/data/allvillages_v2.tsv")

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
            #isogloss = df_filtered$dialect_group)


map.feature(languages = df$Language,
            latitude = df$Lat,
            longitude = df$Lon)
