library(XML)
library(httr)

getCOOR <- function(SRS, RC, Provincia = '',Municipio = ''){
  
  ua <- user_agent(paste0("castastRo", " (https://github.com/DelgadoPanadero/CatastRo)"))
  url <- 'http://ovc.catastro.meh.es/ovcservweb/OVCSWLocalizacionRC/OVCCoordenadas.asmx/Consulta_CPMRC'

  query.parms <- list(Provincia=Provincia,
                      Municipio=Municipio,
                      SRS=SRS,
                      RC=RC)
  res <- GET(url, query = query.parms, ua)
  stop_for_status(res)
  res <- xmlToList(xmlParse(res))
  
  
  if(is.null(res$lerr$err$des)){
    
    res <- as.numeric(c(res$coordenadas$coord$geo$xcen,
                        res$coordenadas$coord$geo$ycen))
  }
  
  else{
    stop(res$lerr$err$des)
  }
res
}