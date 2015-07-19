corr <- function(directory, threshold = 0) {
  # save old wd and move into new one
  wd <- getwd()
  setwd(directory)
  
  files <- dir()
    
  observations <- numeric()
  
  for (monitor_file in files) {
    monitor_data <- read.csv(monitor_file)

    # fairly sure that we're supposed to use the complete function here,
    # but can't really see how as that uses IDs but we're (presumably),
    # using filenames here... 
    complete_cases <- monitor_data[complete.cases(monitor_data), ]

    if(nrow(complete_cases) > threshold) {
      # add correlation between sulfate and nitrate if nobs is above threshold
      observations <- c(observations, cor(complete_cases$sulfate, complete_cases$nitrate))
    }
  }
  
  setwd(wd)
  
  observations
}