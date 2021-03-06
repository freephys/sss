#' Write out the setup file for input to sss binary
#'
#' @param setupSpec a list to be written to file in tempdir()
#' @return the full file path to the file written out
setMethod(
  f = ".writeSetup",
  signature = "sssSetup",
  definition = function(setupSpec){
    
    thisOut <- sapply(slotNames(setupSpec), function(x){
      if(slot(setupSpec, x) == "")
        slot(setupSpec, x) <- "NA"
      paste(x, " = ", slot(setupSpec, x), sep="")
    })
                      
    fileLoc <- tempfile(pattern="setup", tmpdir=tempdir(), fileext=".txt")
    write.table(thisOut, file=fileLoc, sep="\t", quote=F, row.names=F, col.names=F)
    
    return(fileLoc)
  }
)



