## install trelliscopejs
#devtools::install_github("hafen/trelliscopejs")

## Load packages
pacman::p_load(tidyverse)
pacman::p_load(trelliscopejs)

## Import Data
Artists  <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artists.csv")
Artworks <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv")


## Subset data
Artworks2 <- Artworks %>% 
  select(Title, ThumbnailURL, URL, 
         Artist, ConstituentID, Nationality, Gender,
         Medium, Classification, Department,
         Dimensions, `Height (cm)`, `Width (cm)`) %>%
  mutate(Nationality = str_replace_all(Nationality,"[()]",""),
         Gender = str_replace_all(Gender, "[()]",""),
         URL_artist = paste0("https://www.moma.org/artists/",ConstituentID),
         URL_piece = as.character(URL) %>% str_replace("http://","https://")) %>% 
  filter(URL_piece != "NA") %>%
  filter(Medium == "Oil on canvas") %>% 
  mutate(panel = img_panel(ThumbnailURL),
         URL_piece = ifelse(is.na(URL_piece), "http://www.moma.org/collection/works", URL_piece)) %>% 
  select(-ConstituentID)

## Run Trelliscope 
Artworks2  %>% 
  trelliscope(name = "MOMA Collection",
              desc = "The Museum of Modern Art (MoMA) Collection",
              nrow = 3, ncol = 7,
              state = list(labels = c("Artist","URL_artist","Title","URL_piece")),
              path = "moma",
              thumb = TRUE)

