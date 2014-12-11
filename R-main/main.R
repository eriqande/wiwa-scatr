library(scatR)
library(coda)
#library(doMC)

#registerDoMC()

boundary_file = "Data/birdboundary.txt"
allele_file = paste("Data/",sp,"_all.txt",sep="")
location_file = paste("Data/",sp,"_loc.txt",sep="")


parent_dir = file.path(root_dir, paste(sp,suff,"/",sep=""))

options["OUTPUTALFREQ"] = TRUE

m=MCMC_Chains(allele_file,location_file,boundary_file,
              nChains=nChains,nBurn=nBurn,nIter=nIter,nThin=nThin,
              options=options)

save(m,file=file.path(parent_dir, "mcmc.Rdata"))

cov_func = calc_cov_powered_exp
if (options[["USEMATERN"]])
    cov_func = calc_cov_matern

#generate_reports(m, dir=dir, prefix=paste("Ind",i,sep=""), cov_func=cov_func)
