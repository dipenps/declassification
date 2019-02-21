getcompM <-
function(exprM,method=c("DSA","cibersort"),basis,marker,savefilename=NULL)
  {
    if(is.null(rownames(exprM)))stop("gene names are missing")
    if(method=="DSA")
      {
       if(missing(marker))stop("need markers")
       cell.gene<-do.call("rbind",lapply(1:length(marker),function(x)cbind(gene=marker[[x]],cell=names(marker)[x])))
       rownames(cell.gene)<-cell.gene[,"gene"]
       cell.gene<-cell.gene[rownames(cell.gene)%in%rownames(exprM),]
       if(length(unique(cell.gene[,2]))<8) warning("some cell types have no marker genes in this dataset")
       if(!is.matrix(cell.gene)) stop("no marker genes in this dataset") 
       compM<-myDSA(2^exprM,cell.gene,robust=TRUE)
     }
      if(method=="cibersort")
      {
        if(missing(basis))stop("need basis matrix")
        s<-intersect(rownames(basis),rownames(exprM))
        if(length(s)<100)stop("less than 100 signature genes for cibersort")
        compM<-myCIBERSORT(basis[s,],2^exprM[s,])
        compM<-t(compM[,1:22])
      }
    if(!is.null(savefilename))
      {
        save(compM,file=savefilename)
      }else{return(compM);}
  }
