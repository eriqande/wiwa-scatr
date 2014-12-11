# setwd("/Users/eriq/Documents/work/assist/kristenruegg/scatR_with_colin/Analysis-Kristen")
if(!file.exists("/tmp/scratch2")) dir.create("/tmp/scratch2")
root_dir = path.expand("/tmp/scratch2") #"Scratch/"
sp = "WIWA"
suff = "_1deg_cv_rand_loc"

options = list( #TMPDIR = file.path(root_dir, paste(sp,suff,"/",sep="")),
								TMPDIR = file.path(root_dir, paste(sp,suff,sep="")),
                RETURNFIT = FALSE,
                LOCATE = TRUE,
                USEMATERN = FALSE,
                VERBOSE = FALSE,
                
                NULLPROB = 0.01,
                DELTA = 0.05,
                
                MAXCELL = 3000, #1 deg
                #MAXCELL = 2000,  #2 deg
                
                ALPHAMIN = c(0,1,0.01,0),
                ALPHAMAX = c(10,20000,2,10),

                ALPHASD = c(0.2,0.2, 0.2,0.05),
                THETASD = 0.1,
                ETASD = 1,
                XISD = 0.1,
                BETASD = 3,
                BETARANGE = c(0.01,25),

                PERMUTE = TRUE,
                
                OUTPUTALFREQ = FALSE,
                GZIPOUTPUT = FALSE
            )

nBurn = 10 #1000
nIter = 10 #1000
nThin = 1 #100
nChains=2

pts = 1000
ac.lag = 500

source("R-main/main.R")




#source("main_cv.R")
#source("main_cv_loc.R")
#source("main_cv_rand_loc.R")