
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
KernSmooth 2.23 loaded
Copyright M. P. Wand 1997-2009

Attaching package: ‘gplots’

The following object is masked from ‘package:stats’:

    lowess

/tmp/scratch2/WIWA_1deg_cv_rand_loc 
Error: could not find function "mask_precip_with_boundary"
In addition: Warning messages:
1: package ‘raster’ was built under R version 3.1.1 
2: package ‘gplots’ was built under R version 3.1.2 
```

So, that fails, and I can't find any definition of a `mask_precip_with_boundary()` function
anywhere (not even in old revisions of the package).



Issues:

1. It appears that it needs the `sp` package which does not actually get loaded.
    ```r
    > source("R-main/main.R")
    Error in adjust_boundary(bound, locs) : 
    could not find function "SpatialPolygons"
    ```
2. There is no definition of `mask_precip_with_boundary` 
