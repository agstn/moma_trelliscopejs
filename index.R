# Load tidyverse packages
library(tidyverse)

# install & load trelliscopejs  
devtools::install_github("hafen/trelliscopejs")
library(trelliscopejs)

# Import Data
Artsts1  <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artists.csv")
Artwrks1 <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv")

# data wrangling data
Artwrks2 <- Artwrks1 %>% 
  select( Title, ThumbnailURL, URL, 
          Artist, ConstituentID, Nationality, Gender,
          Medium, Classification, Department,
          `Height (cm)`, `Width (cm)`) %>%
  mutate( Nationality = str_replace_all(Nationality,"[()]",""),
          Gender = str_replace_all(Gender, "[()]",""),
          `Aspect Ratio` = ifelse(`Height (cm)`>0 & `Width (cm)`>0, `Width (cm)`/`Height (cm)`,NA),
          URL_artist = paste0("https://www.moma.org/artists/",ConstituentID),
          URL_piece = as.character(URL) %>% str_replace("http://","https://")) %>%
  filter( URL_piece != "NA") %>%
  mutate( panel = img_panel(ThumbnailURL),
          URL_piece = ifelse(is.na(URL_piece), "http://www.moma.org/collection/works", URL_piece)) %>% 
  select(-ConstituentID)

#  run trelliscope
Artwrks2 %>% 
  trelliscope(name = "MOMA Collection",
              desc = paste0("The Museum of Modern Art (MoMA) Collection"," (n=",nrow(.),")"),
              nrow = 2, ncol = 6,
              state = list(labels = c("Artist","URL_artist","Title","URL_piece")),
              path = "~/moma_trelliscopejs/app")

