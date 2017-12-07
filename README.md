## Visulization The Museum of Modern Art (MoMA) Collection using Trelliscope

<figure>
<img src="https://github.com/agstn/moma_trelliscopejs/blob/master/img/DOjIQBeX0AE3iuh.jpg" 
align="center" height="454" width="250" >
<figcaption>  
<a href="https://twitter.com/BauhausMovement/status/930213508041592833"> Source: Bauhaus Movement</a> 
</figcaption>
</figure>
<br><br>

### What is Trelliscope?

Trelliscope is a powerful, scalable, interactive approach to data visualization. The idea behind trelliscope is strongly embedded in the small multiples or trellis display, where data are split into groups and displayed into a grid. This technique is especially suitable for visualizing large datasets and make comparisons easier. Trelliscope was developed by [Ryan Hafen](http://ryanhafen.com/) and further details can be found in [Ryan’s presentation Modern Approaches to Data Exploration with Trellis Display](http://slides.com/hafen/trelliscopejs).

### What is the MOMA Collection

The Museum of Modern Art (MoMA) Collection contains a collection of 200,000 works of art from around the word spanning the last 150 years. The Museum’s [website](https://www.moma.org/collection/)  features 76,053 artworks from 21,635 artists. The museum made their Artwork data publicly available through [Github](https://github.com/MuseumofModernArt/collection). Here we are going to illustrate how to visualize this large dataset using trelliscope.


### R code

Probably the first step in data visualization is to import and clean the dataset. For this task we have selected to use the tidyverse. In short, the tidyverse is a set of R packages that share a common data representation and API design. However, because the goal of this project is to illustrate how easy and useful the trelliscope approach is, we have limited the data cleaning to a minimum. 

We need to install trelliscopejs from Github as the package is not yet in CRAN. Once the package is installed we load it.

```
# Load tidyverse packages
library(tidyverse)
# install & load trelliscopejs  
devtools::install_github("hafen/trelliscopejs")
library(trelliscopejs)

```

Once we have both packages loaded we are ready to import the data from the MOMA Github repo. We load all data available, albeit we will use only the Artwork file.

The Artworks data contains 132,150 records, representing all of the works that have been accessioned into MoMA’s collection and cataloged. It includes basic metadata for each work, including title, artist, date made, medium, dimensions, and date acquired by the Museum.

The Artists dataset contains 15,366 records, representing all the artists who have work in MoMA's collection and have been cataloged in our database. It includes basic metadata for each artist. For this illustration we will not use the Artists dataset but I imported anyway.

```
# Import Data
Artsts1  <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artists.csv")
Artwrks1 <- read_csv("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv")
```

The next step is the heart of data wrangling. As mentioned it before we selected to perform this using the tidyverse as we feel the syntax is clearer to understand:
1- Select the metadata we are interesting in visualizing (`select`)
2- Clean the `Nationality` & `Gender` variable by removing necessary characters
3- Create a new variable `Aspect Ratio` for each artwork containing Height & Width.
4- Create URL for the Artist & Artwork piece
5- Remove from the database all artworks that have not a corresponding page in the MOMA website
6- Create the panel using `img_panel` that will display each artwork image in the panel
7- Remove unnecessary variable

```
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
```

We are now ready to run the code that will generate the visualization. Just passing the dataset we previously created `Artwrks2` and setting a few options. **THAT IS IT**

```
#  run trelliscope
Artwrks2 %>% 
trelliscope(name = "MOMA Collection",
desc = paste0("The Museum of Modern Art (MoMA) Collection"," (n=",nrow(.),")"),
nrow = 2, ncol = 6,
state = list(labels = c("Artist","URL_artist","Title","URL_piece")),
path = "~/moma_trelliscopejs/app")
```
### Launch the Visualization App
![Capture2](img/FireShotCapture2agstn.github.io_moma_trelliscopejs_app.png)

### Left / Right Help
![Capture3](img/FireShotCapture3agstn.github.io_moma_trelliscopejs_app.png)

![Capture5](img/FireShotCapture5agstn.github.io_moma_trelliscopejs_app_.png)

### Grid
![Capture6](img/FireShotCapture6agstn.github.io_moma_trelliscopejs_app_.png)

### Label
![Capture7](img/FireShotCapture7agstn.github.io_moma_trelliscopejs_app_.png)

### Filter
![Capture8](img/FireShotCapture8agstn.github.io_moma_trelliscopejs_app_.png)

### Sort
![Capture9](img/FireShotCapture9agstn.github.io_moma_trelliscopejs_app_.png)

