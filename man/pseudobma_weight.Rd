% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bb-stacking.R
\name{pseudobma_weight}
\alias{pseudobma_weight}
\title{Pseudo-BMA weighting using Bayesian bootstrap samples adjustment}
\usage{
pseudobma_weight(lpd_point, BB_n = 1000, alpha = 1, seed = NULL)
}
\arguments{
\item{lpd_point}{A matrix of pointwise leave-one-out likelihood evaluated in different models. Each column corresponds to one model.}

\item{BB_n}{A positive integer indicating the number of samples in Bayesian Bootstrap. Default is 1000.}

\item{alpha}{A positive scalar; the shape parameter in the Dirichlet distribution when doing Bayesian Bootstrap. Default is 1.}

\item{seed}{An integer; optional. If specified, it fixes the random seed when dong Bayesian Bootstrap.}
}
\value{
A vector of model weights.
}
\description{
Pseudo-BMA weighting using Bayesian bootstrap samples adjustment
}
\details{
\code{lpd_point} is a matrix of pointwise leave-one-out likelihood, which can be calculated from  \code{\link{loo}} or through running LOO in advance. It should be a \eqn{N} by \eqn{K} matrix when Sample size is \eqn{N} and model number is \eqn{K}.   Bayesian bootstrap  takes into account the uncertainty of finite data points and regularize the weights making them go further away from 0 and 1. The shape parameter in the Dirichlet distribution is \code{alpha}. When \code{alpha}=1, the distribution is uniform on the simplex space. A smaller \code{alpha} will keeps the final weights more away from 0 and 1.
}
\examples{
\dontrun{
loo1 <- loo(log_lik1)$pointwise[,1]
loo2 <- loo(log_lik2)$pointwise[,1]
pseudobma_weight(cbind(loo1, loo2))
}

}
\seealso{
\code{\link{loo}} for details on leave-one-out elpd estimation.

\code{\link{stacking_weight}} for model weighting by stacking on log score.
}
