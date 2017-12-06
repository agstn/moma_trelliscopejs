## Visulization App for The Museum of Modern Art (MoMA) Collection

  <figure>
  <img src="https://github.com/agstn/moma_trelliscopejs/blob/master/img/DOjIQBeX0AE3iuh.jpg" 
       align="center" height="454" width="250" >
  <figcaption>  
    <a href="https://twitter.com/BauhausMovement/status/930213508041592833"> Source: Bauhaus Movement</a> 
  </figcaption>
  </figure>
   <br><br>

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

### Launch the Visualization App
![Capture2](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%202%20agstn.github.io_moma_trelliscopejs_app.png)

### Left / Right Help
![Capture3](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%203%20agstn.github.io_moma_trelliscopejs_app.png)

![Capture5](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%205%20agstn.github.io_moma_trelliscopejs_app_.png)

### Grid
![Capture6](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%206%20agstn.github.io_moma_trelliscopejs_app_.png)

### Label
![Capture7](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%207%20agstn.github.io_moma_trelliscopejs_app_.png)

### Filter
![Capture8](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%208%20agstn.github.io_moma_trelliscopejs_app_.png)

### Sort
![Capture9](https://github.com/agstn/moma_trelliscopejs/blob/master/img/FireShot%20Capture%209%20agstn.github.io_moma_trelliscopejs_app_.png)

