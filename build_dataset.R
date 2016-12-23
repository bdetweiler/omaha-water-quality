library(dplyr)

waterquality2006 <- read.csv('waterquality2006.csv')
waterquality2006$year <- 2006
waterquality2007 <- read.csv('waterquality2007.csv')
waterquality2007$year <- 2007
waterquality2008 <- read.csv('waterquality2008.csv')
waterquality2008$year <- 2008
waterquality2009 <- read.csv('waterquality2009.csv')
waterquality2009$year <- 2009
waterquality2010 <- read.csv('waterquality2010.csv')
waterquality2010$year <- 2010
waterquality2011 <- read.csv('waterquality2011.csv')
waterquality2011$year <- 2011
waterquality2012 <- read.csv('waterquality2012.csv')
waterquality2012$year <- 2012
waterquality2013 <- read.csv('waterquality2013.csv')
waterquality2013$year <- 2013
waterquality2014 <- read.csv('waterquality2014.csv')
waterquality2014$year <- 2014
waterquality2015 <- read.csv('waterquality2015.csv')
waterquality2015$year <- 2015

waterquality <- rbind(waterquality2006,
                      waterquality2007,
                      waterquality2008,
                      waterquality2009,
                      waterquality2010,
                      waterquality2011,
                      waterquality2012,
                      waterquality2013,
                      waterquality2014,
                      waterquality2015)

waterquality$Florence.Plant <- as.character(waterquality$Florence.Plant)
florence.split <- strsplit(waterquality$Florence.Plant, split="-")

waterquality$florence.from <- NA
waterquality$florence.to <- NA
for (i in 1:length(florence.split)) {
  if (length(florence.split[[i]]) > 0) {
    waterquality$florence.to[i] <- gsub("<", "", florence.split[[i]][1])
    if (length(florence.split[[i]]) > 1) {
      waterquality$florence.from[i] <- gsub("<", "", florence.split[[i]][2])
    }
  }
}


waterquality$Platte.South.Plant <- as.character(waterquality$Platte.South.Plant)
platte.south.split <- strsplit(waterquality$Platte.South.Plant, split="-")

waterquality$platte.south.from <- NA
waterquality$platte.south.to <- NA
for (i in 1:length(platte.south.split)) {
  if (length(platte.south.split[[i]]) > 0) {
    waterquality$platte.south.to[i] <- gsub("<", "", platte.south.split[[i]][1])
    if (length(platte.south.split[[i]]) > 1) {
      waterquality$platte.south.from[i] <- gsub("<", "", platte.south.split[[i]][2])
    }
  }
}


waterquality$Peaking.Wells <- as.character(waterquality$Peaking.Wells)
peaking.wells.split <- strsplit(waterquality$Peaking.Wells, split="-")

waterquality$peaking.wells.from <- NA
waterquality$peaking.wells.to <- NA
for (i in 1:length(peaking.wells.split)) {
  if (length(peaking.wells.split[[i]]) > 0) {
    waterquality$peaking.wells.to[i] <- gsub("<", "", peaking.wells.split[[i]][1])
    if (length(peaking.wells.split[[i]]) > 1) {
      waterquality$peaking.wells.from[i] <- gsub("<", "", peaking.wells.split[[i]][2])
    }
  }
}

water