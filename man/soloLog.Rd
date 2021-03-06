% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soloTB.R
\name{soloLog}
\alias{soloLog}
\title{Download, reorganize and export the binary log files from 3DR Solo Pixhawk controller or the telemetry log files from the Solo radio control unit}
\usage{
soloLog(logFileSample = "recent", logSource = "rc", logDest = tempdir(),
  downloadOnly = FALSE, netWarn = FALSE, renameFiles = TRUE,
  makeSP = FALSE)
}
\arguments{
\item{logFileSample}{\code{character} , options are:  \code{recent} download the most recent logfile,  \code{all} downloads all logfiles, or a plain number e.g. \code{2} for a specific logfile. Note the telemetry logfiles are numbering from 1 to 9 only, the most recent one is not numbered. The binary logfiles from the pixhawk are numbering continously but only the last 50 files or so will exist.}

\item{logSource}{\code{character}, options are: \code{rc} = logfiles from the radio control, \code{pixhawk} = logfiles from the flightcontroller, default is set to  \code{rc}. The radio control is providing the last ten telemetry data files, while the flight controller provides the latest 50 binary logfiles.}

\item{logDest}{\code{character} (existing) destination path to which the logs should be downloaded to}

\item{downloadOnly}{\code{logical} wether to only download the files or also convert and rename them, default is set FALSE}

\item{netWarn}{\code{logical} wether to warn and waits before starting a connection to the controller. helps while testing due to occassional wifi shutdowns of the Solo, default is set to FALSE}

\item{renameFiles}{\code{logical} renames the log and gpx files according to the time period, default is set TRUE}

\item{makeSP}{\code{logical} wether returning an \code{sp} object from the gpx files or not, default is FALSE}
}
\description{
Wraps the mavtogpx.py converter as provided by the \href{http://python.dronekit.io/}{dronkit library}). It downloads and optionally converts the most important 3DR Solo logfiles. Optionally you may import the geometries and data as \code{sp} object.
}
\note{
for using the Solo stuff is tested only for Linux and the bash shell under Windows 10. You need to install the following python libs: \cr 
\code{sudo pip install pymavlink}  \cr 
\code{sudo pip install dronekit-sitl} \cr 
\code{sudo pip install dronekit} \cr \cr
Additionally you need \code{sshpass}:\cr
\code{sudo apt-get install sshpass} \cr 
\cr And please rememeber - you need to be connected at least to a running 3DR Solo radio control and if you want to donload data from the Pixhawk to a Solo UAV
}
\examples{
\dontrun{
## download recent telemetry log file from controller and convert it to gpx
soloLog(logFiles = "solo.tlog")

## download the last available logfile from the radio control
soloLog()

## download ALL logfiles from the radio control
soloLog(logFiles = "all")

## download ALL telemetry logfiles from the flight controller
soloLog(logSource = "pixhawk",logFiles = "all")

## download telementry logfile number 5  from the remote control
soloLog(logSource = "rc",logFiles = "5")
}
}
