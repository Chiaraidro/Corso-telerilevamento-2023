## R CODE VARIABILITY 

library(raster)
library(RStoolbox) # for image viewing and variability calculation
library(ggplot2) # for ggplot plotting
library(patchwork) # multiframe with ggplot2 graphs

library(viridis)

setwd("C:/laboratorio_telerilevamento/") # Windows

#importiamo l'immagine e plottiamo 
sen <- brick("sentinel.png")

# band1 = NIR
# band2 = red
# band3 = green
plotRGB(sen, 1, 2, 3, stretch="lin")

 calculation of variability over NIR
nir <- sen[[1]]

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(sd3, col=clsd)


# utilizzo funzione ggplot (apre la finestra per poi inserire il vero plot) 
ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) #geom raster permette di lavorare con una gemoetria raster  
#il laye=fill lo sappiamo scrivendo il nome dell'immagine e vedendo cosa c'è scritto nella parte colore
#il plot ci darà un errore poichè il dato dentro ggplot non può essere un'immagine am una tabella di dati 

#utilizziamo la seguente funzione per trasformare l'immagine (la matrice) in una tabella 
sd3d <- as.data.frame(sd3, xy=T)
ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))

## questo processo si può fare anche con il pacchetto viridis (contiene diverse palette di colori) 
install.packages("viridis")

#la funzione applica scle di colori sul pacchetto viridis 
#scale_fill_viridis() 

ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +  #dento le parentesi metto un'opzione o va di default 
ggtitle("Standard deviation by viridis package")

#usiamo la scala di colori magma sempre nel pacchetto virids 
ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation by viridis package") +

#alla mappa si può aggiungere un titolo 
ggtitle("Standard deviation by magmapackage")

