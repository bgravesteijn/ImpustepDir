\name{mean_impute}
\alias{mean_impute}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
Impute the median for continuous variables, and the mode for categorical variables.
}
\usage{
mean_impute(data = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
dataframe of the data
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  ~Returns a plot showing the OR of the other variables for the missingness of the variable of interest
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

## The function is currently defined as
function (data = NULL) 
{
    for (i in 1:ncol(data)) {
        if (sum(is.na(data[, i])) != 0) {
            if (class(data[, i]) == "factor") {
                mode_val <- names(which(table(data[, i]) == max(table(data[, 
                  i]))))
                meani[, i][is.na(data[, i])] <- mode_val
            }
            else {
                mean_val <- median(data[, i], na.rm = TRUE)
                data[, i][is.na(data[, i])] <- mean_val
            }
        }
    }
    return(data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
