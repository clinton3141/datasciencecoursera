pollutantmean <- function(directory, pollutant, id = 1:332) {
  # save wd and move into directory
  wd <- getwd()
  setwd(directory)
  
  # vector to store values
  all_values <- numeric()
  
  # read each file
  for (file_id in id) {
    monitor_data <- read.csv(sprintf("%03d.csv", file_id))
    monitor_values <- monitor_data[[pollutant]]
    
    # filter out NAs and add to vector
    all_values <- c(all_values, monitor_values[!is.na(monitor_values)])
  }
  
  # go back to original wd
  setwd(wd)
  
  # return mean
  mean(all_values)
}