#' @title increment package version minor number for a given patch or update.
#' 
#' @description This function should allow for more regular minor version number increments. Previously this was done manually and so usually forgotten. Include a call to this in the build script for each package.
#' 
#' @param package.path file path to package folder, ending in package name.
#' @param major.version major version number. Change this manually only when there is a major change
#' @param package.origin the package birth date, used to infer package age, which determines the minor number. If you want the minor number to reset to 0 when a major version increment happens, then change this date when you make a major increment. It's also OK to just leave it referenced to the primary package birth date.
#' 
#' @return nothing is returned. Package called for the side effect of modifying the date and version elements of the \code{DESCRIPTION} file.
#' 
#' @export
#' 
IncrementVersion <- function(package.path, major.version="01",package.origin = "2011-01-01"){
    # now update DESCRIPTION
    # get time difference from origin
    increment <-  as.numeric(
            Sys.time() - 
                    as.POSIXct(as.Date(package.origin), 
                            origin = ISOdatetime(1960,1,1,0,0,0),tz="PST")
    )
    
    # determine new version number:
    pkg.vs    <- paste0("Version: ",major.version, ".", as.character(round(increment / 365.25, digits = 4)))
    pkg.dt    <- paste0("Date: ", Sys.Date())
    
    # update version in DESCRIPTION file:
    DESC      <- readLines(file.path(package.path, "DESCRIPTION"))
    Version.i <- grep(DESC, pattern = "Version:")
    Date.i    <- grep(DESC, pattern = "Date:")
    DESC[Version.i] <- pkg.vs
    DESC[Date.i]    <- pkg.dt
    writeLines(DESC, file.path(package.path,"DESCRIPTION"))
}