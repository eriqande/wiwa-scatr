library(scatR)
library(raster)
library(ROCR)
library(stringr)

sps = c("HETH","WIWA")
suffs = c("_cv","_cv_loc")
nChains = 4

sps = c("WIWA")
suffs = c("_1deg_cv_rand_loc")
nChains = 2


nIter=10
data_dir = "./"

for(sp in sps) { 
for(suff in suffs) {
    
    root = file.path("/tmp/scratch2",paste(sp,suff,sep=""))

    cat(root,"\n")

    boundary_file = file.path(data_dir,"Data/birdboundary.txt")
    allele_file = file.path(data_dir,"Data",paste(sp,"_all.txt",sep=""))
    location_file = file.path(data_dir,"Data",paste(sp,"_loc.txt",sep=""))
    isotope_file = file.path(data_dir,"Data",paste(sp,"_isotope.csv",sep=""))

    geno = read_genotype_file(allele_file)
    al = geno[[1]]
    indloc = geno[[2]]
    ind_ids = geno[[4]]
    nind = length(indloc)

    loc = read.table(location_file)
    locs = loc[,c(4,3)]

    r = allele_raster_from_file(root)

    precip_rast = mask_precip_with_boundary(boundary_file)

    agg_res = round(res(r)/res(precip_rast))
    agg_res =  round(res(r))
    isomap = raster::resample(aggregate(precip_rast,agg_res,na.rm=TRUE),r,"ngb")
    
    gen_all = list()
    for(c in 1:nChains)
        gen_all[[c]] = list()
    
    for(ind in 1:nind) {
        for(c in 1:nChains) {
            
            r = mask(allele_raster_from_file(root, ind, c), isomap)
            gen_all[[c]][[ind]] = list(r, cellFromXY(r,locs[indloc[ind],]))
            
        }
    
        cat(ind,'\n')
    }
    
    save(gen_all,file=file.path(root,"gen_all_res.Rdata"))
    
}
}