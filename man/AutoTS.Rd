% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Adrian_Antico_Modeling_Tools_Library.R
\name{AutoTS}
\alias{AutoTS}
\title{AutoTS is an automated time series modeling function}
\usage{
AutoTS(data, TargetName = "Target", DateName = "DateTime",
  FCPeriods = 30, HoldOutPeriods = 30, TimeUnit = "day", Lags = 25,
  SLags = 2, Ensemble = FALSE)
}
\arguments{
\item{data}{is the source time series data.table}

\item{TargetName}{is the name of the dependent variable in your data.table}

\item{DateName}{is the name of the date column in your data.table}

\item{FCPeriods}{is the number of periods into the future you wish to forecast}

\item{HoldOutPeriods}{is the number of periods to use for validation testing}

\item{TimeUnit}{is the level of aggregation your dataset comes in}

\item{Lags}{is the number of lags you wish to test in various models (same with moving averages)}

\item{SLags}{is the number of seasonal lags you wish to test in various models (same with moving averages)}

\item{Ensemble}{set to TRUE if you want to utilize this functionality}
}
\value{
If Ensemble is TRUE, return a data.table object with a date column and the forecasts, an evaluation data set, and an ensemble training data set (all in a list). If Ensemble is FALSE, then all items returned except the ensemble training set.
}
\description{
AutoTS builds the best time series models for each type, compares all types, selects the winner, and generate forecasts. Ensemble is also a feature where a randomForest model is build on the model outputs to utilize all in a more accuracte forecast.
}
\examples{
data <- data.table(DateTime = as.Date(Sys.time()), Target = stats::filter(rnorm(1000,mean = 50, sd = 20), filter=rep(1,10), circular=TRUE))
data[, temp := seq(1:1000)][, DateTime := DateTime - temp][, temp := NULL]
data <- data[order(DateTime)]
output <-   AutoTS(data,
                   TargetName     = "Target",
                   DateName       = "DateTime",
                   FCPeriods      = 30,
                   HoldOutPeriods = 30,
                   TimeUnit       = "day", # c("hour","day","week","month","quarter","year"),
                   Lags           = 25,
                   SLags          = 2,
                   Ensemble       = FALSE)
}
\author{
Adrian Antico and DougVegas at RemixInstitute.com
}