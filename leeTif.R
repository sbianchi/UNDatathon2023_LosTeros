leeTif = function(path, nsample = NULL) {
  
  
  url = length(grep('https:',path)) >= 1
  
  if(url) {
    geotiff_file <- tempfile(fileext='.tif')
    httr::GET(path,httr::write_disk(path=geotiff_file))
    s <- rast(geotiff_file)
  } else {
    s <-
      rast(path) 
  }
  
  
  if(!is.null(nsample)) {
    s = spatSample(s, nsample,method = 'regular',as.raster=TRUE)
  } else {
    
  }
  
  dfres <- as.data.frame(s, xy = TRUE)
  return(dfres)
  
}
