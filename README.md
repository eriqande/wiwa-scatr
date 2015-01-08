
# WIWA scatr

This documents my attempts to get colin rundels isoscatR package to work.

Starting off I am going to to just see how it runs on the old microsat WIWA data of yore that
he ran.

Long ago he provided a big zip ball of stuff.  I am trying to go through that to figure out what he did:


Do this from the directory that holds the Rstudio project:
```r
# get the repo:
git clone https://github.com/eriqande/wiwa-scatr

# first do a very short run of the MCMC
library(sp)
source("R-main/main_WIWA.R")

# then source "generate_rasters_allgen.R" which I thought
# might be a step toward graphically summarizing the results.
source("R-main/generate_rasters_allgen.R")
Loading required package: gplots

Attaching package: ‘gplots’

The following object is masked from ‘package:stats’:

    lowess

/tmp/scratch2/WIWA_1deg_cv_rand_loc 
Error in (function (classes, fdef, mtable)  : 
  unable to find an inherited method for function ‘rasterize’ for signature ‘"RasterLayer", "SpatialPolygons"’
> sessionInfo()
R version 3.1.2 (2014-10-31)
Platform: x86_64-pc-linux-gnu (64-bit)

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
```

So, that fails, and it seems to be something within the raster package probably not finding
a method to dispatch on the signature as listed above.


