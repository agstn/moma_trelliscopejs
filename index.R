## install trelliscopejs  
# devtools::install_github("hafen/trelliscopejs")

## Load packages
pacman::p_load(tidyverse)
pacman::p_load(trelliscopejs)

## Import Data
Artsts1  <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artists.csv")
Artwrks1 <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv")

## Subset data
Artwrks2 <- Artwrks1 %>% 
  select( Title, ThumbnailURL, URL, 
          Artist, ConstituentID, Nationality, Gender,
          Medium, Classification, Department,
          `Height (cm)`, `Width (cm)`) %>%
  mutate( Nationality = str_replace_all(Nationality,"[()]",""),
          `Aspect Ratio` = ifelse(`Height (cm)`>0 & `Width (cm)`>0, `Height (cm)`/`Width (cm)`,NA),
          Gender = str_replace_all(Gender, "[()]",""),
          URL_artist = paste0("https://www.moma.org/artists/",ConstituentID),
          URL_piece = as.character(URL) %>% str_replace("http://","https://")) %>% 
  filter( URL_piece != "NA") %>%
  mutate( panel = img_panel(ThumbnailURL),
          URL_piece = ifelse(is.na(URL_piece), "http://www.moma.org/collection/works", URL_piece)) %>% 
  select(-ConstituentID)

##  run trelliscope
Artwrks2 %>% 
  trelliscope(name = "MOMA Collection",
              desc = paste0("The Museum of Modern Art (MoMA) Collection"," (n=",nrow(.),")"),
              nrow = 3, ncol = 7,
              state = list(labels = c("Artist","URL_artist","Title","URL_piece")),
              path = "~/moma_trelliscopejs/app")

