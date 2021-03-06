library(rworldmap)
library(RColorBrewer)
library(ggplot2)

countries = read.csv("countries.csv", na.strings = " NA")
countries$GDP = as.numeric(as.character(countries$GDP))

sPDF = joinCountryData2Map(countries, joinCode = "NAME", nameJoinColumn = "Country",
                           verbose = TRUE)

png(filename = "CountryGDP.png", width = 800, height = 600, units = "px")
mapParams = mapCountryData(sPDF, nameColumnToPlot = "GDP", missingCountryCol = "dark grey",
                           addLegend = FALSE, oceanCol = "lightsteelblue2", numCats = 15,
                           catMethod = "logFixedWidth", colourPalette = brewer.pal(9, "RdPu"))
do.call(addMapLegend, c(mapParams, legendWidth = 0.5, legendMar = 2))
dev.off()