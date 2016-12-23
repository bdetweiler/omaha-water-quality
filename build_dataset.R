library(ggplot2)
library(data.table)
library(dplyr)
library(lubridate)

waterquality2006 <- read.csv('data/waterquality2006.csv')
waterquality2006$year <- 2006
waterquality2007 <- read.csv('data/waterquality2007.csv')
waterquality2007$year <- 2007
waterquality2008 <- read.csv('data/waterquality2008.csv')
waterquality2008$year <- 2008
waterquality2009 <- read.csv('data/waterquality2009.csv')
waterquality2009$year <- 2009
waterquality2010 <- read.csv('data/waterquality2010.csv')
waterquality2010$year <- 2010
waterquality2011 <- read.csv('data/waterquality2011.csv')
waterquality2011$year <- 2011
waterquality2012 <- read.csv('data/waterquality2012.csv')
waterquality2012$year <- 2012
waterquality2013 <- read.csv('data/waterquality2013.csv')
waterquality2013$year <- 2013
waterquality2014 <- read.csv('data/waterquality2014.csv')
waterquality2014$year <- 2014
waterquality2015 <- read.csv('data/waterquality2015.csv')
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

#################################################################
# Clean the numeric columns. All values will be treated as 
# "less than or equal to", since the reports use '<' a lot
#################################################################
waterquality$year <- as.POSIXct(strptime(as.character(waterquality$year),"%Y",tz="GMT"))

waterquality$Maximum.Allowed <- gsub("<", "", waterquality$Maximum.Allowed)
waterquality$Maximum.Allowed <- as.numeric(waterquality$Maximum.Allowed)

waterquality$Highest.Level.Detected <- gsub("<", "", waterquality$Highest.Level.Detected)
waterquality$Highest.Level.Detected <- as.numeric(waterquality$Highest.Level.Detected)

waterquality$Average.Level.Detected <- gsub("<", "", waterquality$Average.Level.Detected)
waterquality$Average.Level.Detected <- as.numeric(waterquality$Average.Level.Detected)

waterquality$Goal <- gsub("<", "", waterquality$Goal)
waterquality$Goal <- as.numeric(waterquality$Goal)

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
waterquality$florence.from <- as.numeric(waterquality$florence.from)
waterquality$florence.to <- as.numeric(waterquality$florence.to)


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
waterquality$platte.south.from <- as.numeric(waterquality$platte.south.from)
waterquality$platte.south.to <- as.numeric(waterquality$platte.south.to)


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
waterquality$peaking.wells.from <- as.numeric(waterquality$peaking.wells.from)
waterquality$peaking.wells.to <- as.numeric(waterquality$peaking.wells.to)

waterquality$Range.Detected <- as.character(waterquality$Range.Detected)
range.detected.split <- strsplit(waterquality$Range.Detected, split="-")
waterquality$range.detected.from <- NA
waterquality$range.detected.to <- NA
for (i in 1:length(range.detected.split)) {
  if (length(range.detected.split[[i]]) > 0) {
    waterquality$range.detected.from[i] <- gsub("<", "", range.detected.split[[i]][1])
  }
  if (length(range.detected.split[[i]]) > 1) {
    waterquality$range.detected.to[i] <- gsub("<", "", range.detected.split[[i]][2])
  }
}
waterquality$range.detected.from <- as.numeric(waterquality$range.detected.from)
waterquality$range.detected.to <- as.numeric(waterquality$range.detected.to)


saveRDS(waterquality, 'waterquality.rds')
waterquality <- readRDS('waterquality.rds')

