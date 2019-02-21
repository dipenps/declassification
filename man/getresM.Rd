\name{getresM}
\alias{getresM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculating residule profile for each sample
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  calcualte residule profile for each sample based on cell component
  profile. 
}
\usage{
getresM(exprM, compM, basesamples, method = c("csSAM", "NMF"), uselogvalue = c(FALSE, TRUE))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{exprM}{
    %%     ~~Describe \code{exprM} here~~
    a gene by sample matrix (log-transformed value)
}
  \item{compM}{
    %%     ~~Describe \code{compM} here~~
    a cell component by sample matrix. This can be obtained using
    getcompM() function
}
\item{basesamples}{
  sample IDs used to deconvolution. These samples are used to estimate
  the cell type specific profile under normal conditions. Thus, they
  should be normal/control samples in theory.
%%     ~~Describe \code{basesamples} here~~
}
  \item{method}{
    %%     ~~Describe \code{method} here~~
    Methods used for deconvolution. It must be csSAM or NMF.The former
    is the least squre linear deconvolution used in csSAM. The latter is
    non-negative least sqaure linear deconvolution.  
}
  \item{uselogvalue}{
    %%     ~~Describe \code{uselogvalue} here~~
    indicating whether using original value or log-transformed value.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(exprML)
data(basis)
r<-getcompM(exprML[[1]],method="cibersort",basis=basis)
data(sampleIDs)
resM<-getresM(exprM=exprML[[1]],compM=r,basesamples=sampleIDs[[1]][["controlsamples"]],method="NMF",uselogvalue=FALSE)
resM<-getresM(exprM=exprML[[1]],compM=r,basesamples=sampleIDs[[1]][["controlsamples"]],method="csSAM",uselogvalue=FALSE)
}