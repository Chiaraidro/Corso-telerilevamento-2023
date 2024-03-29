## IDENTIFICAZIONE DELLA PORZIONE DI VEGETAZIONE BOSCHIVA DISTRUTTA DALLA TEMPESTA VAIA (2018) 
## Questo codice può essere usato per altre tempeste e territori, variando il set di immagini e gli eventuali nomi assegnati 

# impostazione ed installazione di pacchetti utili 
install.packages(raster)
install.packages(ggplot2)

library(raster)
library(ggplot2)

# settaggio cartella di lavoro (scegliere il proprio sistema operativo con #) 
setwd("C:/Vaia") # Windows
# setwd("~/Vaia") # Linux
# setwd("/Users/emma/desktop/Vaia") # Mac

# caricamento e visualizzazione delle immagini pre e post tempesta 
Pre <- brick("False9.png") # caricamento immagine pre tempesta 
plotRGB(Pre, r=1, g=2, b=3, stretch="lin")


Post <- brick("False11.jpg") # caricamento immagine post tempesta 
plotRGB(Post, r=1, g=2, b=3, stretch="lin")
dev.off()

# calcolo NDVI delle due immagini 
ndviPre = (Pre[[1]] - Pre[[2]]) / (Pre[[1]] + Pre[[2]]) # ndvi pre tempesta 
ndviPost = (Post[[1]] - Post[[2]]) / (Post[[1]] + Post[[2]]) #ndvi post tempesta 

# mettiamo a confronto i due NDVI e esportiamoli in formato pdf 
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("confrontondvi.pdf") #al posto di mutliframe inserire il nome desiderato con cui il file verrà esportato 
par(mfrow=c(2,1)) #permette di inserire più immagini in una pagina 
plot(ndviPre, main=" NDVI pre", col=cl)
plot(ndviPost, main= "NDVI post", col=cl)
dev.off()

#creazione istogrammi per gli NDVi calcolati e loro esportazione 

pdf("istogrammi_ndvi.pdf") #al posto di istogrammi inserire il nome desiderato con cui il file verrà esportato 
par(mfrow=c(1,2))
ndvi_valuesPre <- getValues(ndviPre) #funzione restituisce una matrice di valori delle celle corrispondenti alle posizioni specificate
v1 <-as.vector(ndvi_valuesPre) #per trasformare l'oggetto in un vettore
hist(v1, main = "Istogramma NDVI pre", xlab = "NDVI", ylab = "Frequenza",col="green") #la funzione crea un istogramma 
ndvi_valuesPost <- getValues(ndviPost)
v2 <-as.vector(ndvi_valuesPost)
hist(v2, main = "Istogramma NDVI post", xlab = "NDVI", ylab = "Frequenza",col="yellow")
dev.off()


#eseguiamo la differenza tra i due NDVI e plottiamo con la scala di colori cl
difndvi= ndviPre - ndviPost
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("dif_ndvi.pdf")
plot(difndvi, main="differenza NDVI",col=cl)
dev.off()

# Analisi foto post 2018 per vedere l'evoluzione boschiva fino ad oggi (stesso procedimento usato per l'anno 2018)
F2019<- brick("False2019.png") #caricamento immagine 2019
plotRGB(F2019, r=1, g=2, b=3, stretch="lin")
ndvi2019 = (F2019[[1]] - F2019[[2]]) / (F2019[[1]] + F2019[[2]])
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("ndvi_2019.pdf") 
plot(ndvi2019, main="NDVI 2019", col=cl)
dev.off()
ndvi_values2019 <- getValues(ndvi2019)
v3 <-as.vector(ndvi_values2019)
pdf("istogramma_2019.pdf") 
hist(v3, main = "Istogramma situazione 2019", xlab = "NDVI", ylab = "Frequenza",col="red")
dev.off()

F2020<- brick("False2020.png") #caricamento immagine 2020
plotRGB(F2020, r=1, g=2, b=3, stretch="lin")
ndvi2020 = (F2020[[1]] - F2020[[2]]) / (F2020[[1]] + F2020[[2]])
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("ndvi_2020.pdf") 
plot(ndvi2020, main="NDVI 2020", col=cl)
dev.off()
ndvi_values2020 <- getValues(ndvi2020)
v4 <-as.vector(ndvi_values2020)
pdf("istogramma_2020.pdf") 
hist(v4, main = "Istogramma situazione 2020", xlab = "NDVI", ylab = "Frequenza",col="red")
dev.off()

F2021<- brick("False2021.png") #caricamento immagine 2021
plotRGB(F2021, r=1, g=2, b=3, stretch="lin")
ndvi2021 = (F2021[[1]] - F2021[[2]]) / (F2021[[1]] + F2021[[2]])
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("ndvi_2021.pdf") 
plot(ndvi2021, main="NDVI 2021", col=cl)
dev.off()
ndvi_values2021 <- getValues(ndvi2021)
v5 <-as.vector(ndvi_values2021)
pdf("istogramma_2021.pdf") 
hist(v5, main = "Istogramma situazione 2021", xlab = "NDVI", ylab = "Frequenza",col="red")
dev.off()

F2022<- brick("False2022.png") #caricamento immagine 2022
plotRGB(F2022, r=1, g=2, b=3, stretch="lin")
ndvi2022 = (F2022[[1]] - F2022[[2]]) / (F2022[[1]] + F2022[[2]])
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("ndvi_2022.pdf") 
plot(ndvi2022, main="NDVI 2022", col=cl)
dev.off()
ndvi_values2022 <- getValues(ndvi2022)
v6 <-as.vector(ndvi_values2022)
pdf("istogramma_2022.pdf") 
hist(v6, main = "Istogramma situazione 2022", xlab = "NDVI", ylab = "Frequenza",col="red")
dev.off()

Oggi<- brick("False2023.png") #caricamento immagine oggi
plotRGB(Oggi, r=1, g=2, b=3, stretch="lin")
ndviOggi = (Oggi[[1]] - Oggi[[2]]) / (Oggi[[1]] + Oggi[[2]])
cl <- colorRampPalette(c('darkred','red','yellow','green'))(100) # necessario specificare una scala di colore 
pdf("ndvi_2023.pdf") 
plot(ndviOggi, main="NDVI oggi", col=cl)
dev.off()
ndvi_valuesOggi <- getValues(ndviOggi)
v7 <-as.vector(ndvi_valuesOggi)
pdf("istogramma_2023.pdf") # al posto di istogramma_2023 inserire il nome desiderato con cui il file verrà esportato 
hist(v7, main = "Istogramma situazione Oggi", xlab = "NDVI", ylab = "Frequenza",col="red")
dev.off()


