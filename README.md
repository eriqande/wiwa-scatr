
# WIWA scatr

This documents my attempts to get colin rundels isoscatR package to work.

Starting off I am going to to just see how it runs on the old microsat WIWA data of yore that
he ran.

Long ago he provided a big zip ball of stuff.  I am trying to go through that to figure out what he did.

He has provided a couple of fixes for previous issues, and now it seems that we can get things
working somewhat. But now we have run into another problem.

Here is a bit of a transcript.


Do this from the directory that holds the Rstudio project:
```r
# get the latest scatR
# From within R do this:
devtools::install_github("rundel/isoscatR")

# get the wiwa-scatr repo:
git clone https://github.com/eriqande/wiwa-scatr

# change the run length so it isn't too short!
#(here are the chnages I made)
2015-01-13 12:37 /wiwa-scatr/--% git diff
diff --git a/R-main/main_WIWA.R b/R-main/main_WIWA.R
index c5907a1..8b9a2d1 100644
--- a/R-main/main_WIWA.R
+++ b/R-main/main_WIWA.R
@@ -37,9 +37,9 @@ options = list( #TMPDIR = file.path(root_dir, paste(sp,suff,"/
                 GZIPOUTPUT = FALSE
             )
 
-nBurn = 10 #1000
-nIter = 10 #1000
-nThin = 1 #100
+nBurn = 500
+nIter = 500
+nThin = 100
 nChains=2
 
 pts = 1000



# then cd into the wiwa-scatr directory and start R.

# first do a run of the MCMC:
source("R-main/main_WIWA.R")


# then source "generate_rasters_allgen.R" 
source("R-main/generate_rasters_allgen.R")


# This now runs without any errors or issues.

# Once that is done, we can get the raster layers out:
load("/tmp/scratch2/WIWA/gen_all_res.Rdata")

# and then, for example, plot them.
png(file="raster_examples.png", width = 1000, height = 1200)
par(mfrow=c(4,3))
lapply(1:12, function(x) plot(gen_all[[1]][[x]][[1]], main = paste("bird", x)))
dev.off()

# the resulting plot can be seen in ./raster_examples.png in this repo
```


So, that is great.  And I think I could figure out how to do the cross-validation from the
scripts that Colin provided as well.  But all of that is just using genetic data alone.
We want to use isotope data as well. I can't find any good reproducible example of making
isoscapes, etc.

