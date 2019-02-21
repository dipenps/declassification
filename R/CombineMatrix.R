CombineMatrix <-
function(matrixList)
{
 uniRow<-unique(unlist(lapply(matrixList,function(x)rownames(x))));
 uniCol<-unique(unlist(lapply(matrixList,function(x)colnames(x))));
 
 uniMatrix<-matrix(NA,length(uniRow),length(uniCol),dimnames=list(uniRow,uniCol))

 for(m in matrixList)
 {
     if(!is.matrix(m))stop("not a matrix")
    if(is.null(rownames(m))|is.null(colnames(m)))stop("no row or column names")
    uniMatrix[rownames(m),colnames(m)]<-m[,];
 }
  return(uniMatrix);
}
