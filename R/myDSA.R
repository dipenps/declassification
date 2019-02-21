myDSA <-
function(x, markerM,robust=FALSE){
    
    # compute average expression
    ct<-unique(markerM[,2])
    O <- t(sapply(ct,function(cti)apply(x[markerM[markerM[,2]==cti,1],],2,mean)))
    if(robust) O <- t(sapply(ct,function(cti)2^apply(log2(x[markerM[markerM[,2]==cti,1],]),2,mean)))
    if(sum(is.na(O))>0)stop("NA in expression matrix")
    # solve linear equations
#	f <- lsfit(t(O), rep(1, ncol(O)), intercept=FALSE)
#	g_ <- coef(f)
    f <- fcnnls(t(O), matrix(1, ncol(O), 1))
    g_ <- as.numeric(f$x)
    p <- diag(g_) %*% O
    # add rownames if necessary
    if( is.null(rownames(p)) ){
        rownames(p) <- rownames(O)
    }
    
    # return proportion estimate
    p
}
