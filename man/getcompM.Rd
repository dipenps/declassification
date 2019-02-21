\name{getcompM}
\alias{getcompM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimation of cell components
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  estimation of cell components using DSA or cibersort
}
\usage{
getcompM(exprM, method = c("DSA", "cibersort"), basis,marker,savefilename = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{exprM}{
    %%     ~~Describe \code{exprM} here~~
    gene by sample matrix
}
\item{method}{
  can be either DSA or cibersort. If DSA, the input marker should be provided. If
  cibersort, the input basis matrix is needed.
%%     ~~Describe \code{method} here~~
}
\item{basis}{
  gene by cell type basis matrix used as input for cibersort method
%%     ~~Describe \code{method} here~~
}
\item{marker}{
  list of cell markers used as input for DSA method
%%     ~~Describe \code{method} here~~
}
  \item{savefilename}{
    %%     ~~Describe \code{savefilename} here~~
    file name for the results to be saved. If null, the function will
    return the result as a cell component by sample matrix
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  return a cell component by sample matrix. The value in each cell
  represents the estimated fraction of a particular cell type in this sample.
%%  ~Describe the value returned
%%  If it is a LIST, use
%% \item{comp1 }{Description of 'comp1'}
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
data(marker)
r<-getcompM(exprML[[1]],method="DSA",marker=marker)

}