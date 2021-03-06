% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RemixAutoML.R
\name{EvalPlot}
\alias{EvalPlot}
\title{Function automatically builds calibration plots for model evaluation}
\usage{
EvalPlot(data, PredColName = c("PredictedValues"),
  ActColName = c("ActualValues"), type = c("calibration"),
  bucket = 0.05, aggrfun = function(x) base::mean(x, na.rm = TRUE))
}
\arguments{
\item{data}{Data containing predicted values and actual values for comparison}

\item{PredColName}{String representation of column name with predicted values from model}

\item{ActColName}{String representation of column name with actual values from model}

\item{type}{Calibration or boxplot - calibration aggregated data based on summary statistic; boxplot shows variation}

\item{bucket}{Number of buckets to partition the space on (0,1) for evaluation}

\item{aggrfun}{The statistics function used in aggregation, listed as a function}
}
\value{
Calibration plot or boxplot
}
\description{
This function automatically builds calibration plots and calibration boxplots for model evaluation using regression, quantile regression, and binary and multinomial classification
}
\examples{
\dontrun{
EvalPlot(data,
         PredColName = "predict",
         ActColName  = "target",
         type        = "calibration",
         bucket      = 0.05,
         aggrfun     = function(x) quantile(x, probs = 0.50, na.rm = TRUE))
}
}
\seealso{
Other Model Evaluation and Interpretation: \code{\link{ParDepCalPlots}},
  \code{\link{RedYellowGreen}}, \code{\link{threshOptim}}
}
\author{
Adrian Antico
}
\concept{Model Evaluation and Interpretation}
