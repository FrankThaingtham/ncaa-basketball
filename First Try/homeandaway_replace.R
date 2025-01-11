recode_location <- function(data) {
  if ("location" %in% names(data)) {
    # Recode the 'location' column
    data$location_numeric <- ifelse(
      data$location == "H", 1,
      ifelse(data$location == "A", 0,
             ifelse(data$location == "N", 3, NA))
    )
  } else {
    warning("The 'location' column is not found in the dataset.")
  }
  
  return(data)
}

all_stats <- recode_location(all_stats)