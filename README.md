# App to interface The Museum of Modern Art (MoMA) Collection

Trelliscope is a powerful, scalable, interactive approach to data visualization. The idea behind trelliscope is strongly embedded in the small multiples or trellis display, where data are split into groups and displayed into a grid and especially suitable for visualizing large datasets. Trelliscope was developed by [Ryan Hafen](http://ryanhafen.com/). Details can be found in [Ryan’s presentation Modern Approaches to Data Exploration with Trellis Display](http://slides.com/hafen/trelliscopejs).

The Museum of Modern Art (MoMA) Collection contains a collaction of 200,000 works of art from around the word spanning the last 150 years. The Museum’s [website](https://www.moma.org/collection/)  features 76,053 artworks from 21,635 artists. The museum made their Artwork data publicly available through [Github](https://github.com/MuseumofModernArt/collection). 


## Data Wrangling in R

We selected to clean the data using the tidyverse. In short, the tidyverse is a set of R packages that share a common data respresentation and API design

```
library(tidyverse)
```

## What is trelliscopejs

```
library(trelliscopejs)
```



