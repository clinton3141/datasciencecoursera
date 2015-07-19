complete <- function(directory, id = 1:332) {
  # save old wd and move into new one
  wd <- getwd()
  setwd(directory)
  
  # data frame for the results
  observations <- data.frame()
  
  for (monitor_id in id) {
    monitor_data <- read.csv(sprintf("%03d.csv", monitor_id))
    # count how many complete observations there are
    full_observation_count <- nrow(monitor_data[complete.cases(monitor_data), ])
    # add to data frame
    observations <- rbind(observations, c(monitor_id, full_observation_count))
  }
  
  setwd(wd)
  
  # set column names on the data frame
  colnames(observations) <- c('id', 'nobs')
  
  observations
}