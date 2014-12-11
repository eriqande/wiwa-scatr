
# WIWA scatr

This documents my attempts to get colin rundels isoscatR package to work.

Starting off I am going to to just see how it runs on the old microsat WIWA data of yore that
he ran.



Issues:

1. It appears that it needs the `sp` package which does not actually get loaded.
    ```r
    > source("R-main/main.R")
    Error in adjust_boundary(bound, locs) : 
    could not find function "SpatialPolygons"
    ```
2. There is no definition of `mask_precip_with_boundary` 
