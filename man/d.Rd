\name{d}
\alias{d}
\docType{data}
\title{
Description of the blood gene expression datasets
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(d)}
\format{
  A data frame with 32 observations on the following 6 variables.
  \describe{
    \item{\code{compName}}{a character vector: dataset name}
    \item{\code{diseasetype}}{a character vector: disease type}
    \item{\code{platform}}{a factor with levels \code{GPL10558} \code{GPL1291} \code{GPL15331} \code{GPL16209} \code{GPL2986} \code{GPL4133} \code{GPL570} \code{GPL571} \code{GPL6102} \code{GPL6848} \code{GPL6947} \code{GPL96}}
    \item{\code{caseNum}}{a numeric vector: the number of case samples}
    \item{\code{controlNum}}{a numeric vector: the number of control samples}
    \item{\code{geneNum}}{a numeric vector, the number of genes}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(d)
## maybe str(d) ; plot(d) ...
}
\keyword{datasets}
