# CatastRo

R package to query [Sede electrónica del Catastro](http://ovc.catastro.meh.es/ovcservweb/OVCSWLocalizacionRC/OVCCoordenadas.asmx) API. 
The API is documented [here](http://www.catastro.meh.es/ayuda/lang/castellano/servicios_web.htm).

## Installation

```
library(devtools)
install_github("DelgadoPanadero/CatastRo")
```

## Query a coordinate

The function `RCCOOR` recives the coordinates (X,Y) and the spatial reference used. The return is the casdastral reference of the property in that point, as well as the direction (town street and number)


```
reference <- RCCOOR(X,Y,SRS = EPSG:4230)
print(reference)
``` 

It is also possible to get all the cadastral references in a square of 50 meters side centered in the coordinates (X,Y) throught the function `RCCOOR_distance`

```
references <- RCCOOR_distance(X,Y,SRS = EPSG:4230)
print(references)
``` 

## Query CPMRC 

It is possible, as well, the opposite. Given to the function `CPMRC` a cadastral reference, `CPMRC` returns its coordinates (X,Y) in a particular SRS moreover the direction (town, street and number)

```
direction <- CPMRC(CadastralReference,SRS = EPSG:4230)

# The argument SRS could be missed, in that case, CPMRC() returns the coordinates with which was stored

print(direction)
```
