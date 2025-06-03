


library(rgbif)

# Download GBIF data
OMR_data <- occ_search(scientificName = "Copsychus saularis",
                       country = "NP",                # for Nepal
                       hasCoordinate = TRUE,
                       year = '2000, 2024',    # select the date range
                       issue = NULL,        # data with no issues
                       limit = 5000)


OMR_Points <- OMR_data$data   # seperating the occurence data from the chunks of data containing medatadata and all others




library(spThin)  # loading the library; you need to install first

?thin   # description about the package


str(OMR_Points)


thinned_data_full <- thin(loc.data = OMR_Points, 
                          lat.col = "decimalLatitude", long.col = "decimalLongitude",
                          spec.col = "scientificName", 
                          thin.par = 1, reps = 100,
                          locs.thinned.list.return = TRUE,
                          write.files = TRUE,
                          write.log.file = TRUE,
                          log.file = "OMR.log.file",
                          out.dir = "C:/Users/rkathariya/Downloads",
                          out.base = "OMR",
                          max.files = 5)





