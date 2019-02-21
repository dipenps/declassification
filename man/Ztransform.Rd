\name{Ztransform}
\alias{Ztransform}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
sample-wise z-transformation
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  sample-wise z-transformation to make different datasets more comparable.
}
\usage{
Ztransform(exprM, basesamples)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{exprM}{
    %%     ~~Describe \code{exprM} here~~
    a gene by sample matrix
}
  \item{basesamples}{
    %%     ~~Describe \code{basesamples} here~~
    sample IDs used to calculate parameters (mean and SD) used for
    z-transformation. Only normal/control samples are recommended.
}
}
\details{
  %%  ~~ If necessary, more details than the description above ~~
  Similar to csSAM algorithm, SD of each gene is estimated with a prior.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a gene by sample matrix after Z-transofmration.
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
data(sampleIDs)
r<-Ztransform(exprML[[1]],sampleIDs[[1]][["controlsamples"]])
}