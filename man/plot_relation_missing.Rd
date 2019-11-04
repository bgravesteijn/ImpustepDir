\name{plot_relation_missing}
\alias{plot_relation_missing}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot relationships between missingness
}
\description{
Plot the relationship between the variables of the dataset and the
missingness of the variable of interest
}
\usage{
plot_relation_missing(varbl = NULL, data = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{varbl}{
variable of interest (character)
}
  \item{data}{
dataframe of the data (including the variable of interest)
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a plot showing the OR of the other variables for the missingness of the variable of interest
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
function (varbl = NULL, data = NULL) 
{
    y <- as.numeric(is.na(data[, varbl]))
    x <- data[, -which(colnames(data) == varbl)]
    x$y <- y
    fit <- glm(y ~ ., family = "binomial", data = x)
    plot.df <- data.frame(coef(summary(fit)))
    plot.df$var <- rownames(plot.df)
    ggplot(plot.df[-1, ], aes(x = var, y = exp(Estimate), ymin = exp(Estimate - 
        1.96 * Std..Error), ymax = exp(Estimate + 1.96 * Std..Error))) + 
        geom_pointrange() + theme_bw() + xlab("") + ylab(paste("OR for missing", 
        varbl, "value")) + geom_hline(yintercept = 1) + scale_y_log10() + 
        coord_flip() + theme(text = element_text(size = 16), 
        axis.text.y = element_text(angle = 45))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
