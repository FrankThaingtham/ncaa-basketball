calculate_stat_spread <- function(data) {
  # List of columns to calculate the spread for
  stats <- c(
    "fgm", "fga", "3ptm", "3pta", "oreb", "dreb", "reb", 
    "ftm", "fta", "ast", "stl", "blk", "to"
  )
  
  # Iterate through each stat and calculate the spread
  for (stat in stats) {
    # Columns for team and opponent
    team_col <- paste0("team_", stat)
    opponent_col <- paste0("opponent_", stat)
    spread_col <- paste0(stat, "_spread")
    
    # Check if both columns exist in the data
    if (team_col %in% names(data) && opponent_col %in% names(data)) {
      # Calculate the spread
      data[[spread_col]] <- data[[team_col]] - data[[opponent_col]]
    } else {
      warning(paste("Columns for", stat, "not found in the data."))
    }
  }
  
  return(data)
}
all_stats <- calculate_stat_spread(all_stats)