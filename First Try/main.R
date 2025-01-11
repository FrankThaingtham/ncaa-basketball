# Load necessary library
library(ncaahoopR)
library(dplyr)

# Function to retrieve game statistics for multiple game IDs
get_game_stats <- function(game_ids) {
  # Create an empty list to store results
  game_stats <- list()
  
  # Loop through each game ID
  for (game_id in game_ids) {
    # Retrieve the boxscore for the game
    boxscore <- get_boxscore(game_id)
    
    # Check if the boxscore data is available
    if (is.null(boxscore) || length(boxscore) < 2) {
      next  # Skip if data is missing
    }
    
    # Extract team and opponent names
    team_name <- names(boxscore)[1]  # Home team
    opponent_name <- names(boxscore)[2]  # Away team
    
    # Extract relevant statistics
    game_summary <- data.frame(
      game_id = game_id,
      team_name = team_name,
      opponent_name = opponent_name,
      
      # Team stats
      team_fgm = sum(boxscore[[team_name]][["FGM"]], na.rm = TRUE),
      team_fga = sum(boxscore[[team_name]][["FGA"]], na.rm = TRUE),
      team_3ptm = sum(boxscore[[team_name]][["3PTM"]], na.rm = TRUE),
      team_3pta = sum(boxscore[[team_name]][["3PTA"]], na.rm = TRUE),
      team_oreb = sum(boxscore[[team_name]][["OREB"]], na.rm = TRUE),
      team_dreb = sum(boxscore[[team_name]][["DREB"]], na.rm = TRUE),
      team_reb = sum(boxscore[[team_name]][["REB"]], na.rm = TRUE),
      team_ftm = sum(boxscore[[team_name]][["FTM"]], na.rm = TRUE),
      team_fta = sum(boxscore[[team_name]][["FTA"]], na.rm = TRUE),
      team_ast = sum(boxscore[[team_name]][["AST"]], na.rm = TRUE),
      team_stl = sum(boxscore[[team_name]][["STL"]], na.rm = TRUE),
      team_blk = sum(boxscore[[team_name]][["BLK"]], na.rm = TRUE),
      team_to = sum(boxscore[[team_name]][["TO"]], na.rm = TRUE),
      
      # Opponent stats
      opponent_fgm = sum(boxscore[[opponent_name]][["FGM"]], na.rm = TRUE),
      opponent_fga = sum(boxscore[[opponent_name]][["FGA"]], na.rm = TRUE),
      opponent_3ptm = sum(boxscore[[opponent_name]][["3PTM"]], na.rm = TRUE),
      opponent_3pta = sum(boxscore[[opponent_name]][["3PTA"]], na.rm = TRUE),
      opponent_oreb = sum(boxscore[[opponent_name]][["OREB"]], na.rm = TRUE),
      opponent_dreb = sum(boxscore[[opponent_name]][["DREB"]], na.rm = TRUE),
      opponent_reb = sum(boxscore[[opponent_name]][["REB"]], na.rm = TRUE),
      opponent_ftm = sum(boxscore[[opponent_name]][["FTM"]], na.rm = TRUE),
      opponent_fta = sum(boxscore[[opponent_name]][["FTA"]], na.rm = TRUE),
      opponent_ast = sum(boxscore[[opponent_name]][["AST"]], na.rm = TRUE),
      opponent_stl = sum(boxscore[[opponent_name]][["STL"]], na.rm = TRUE),
      opponent_blk = sum(boxscore[[opponent_name]][["BLK"]], na.rm = TRUE),
      opponent_to = sum(boxscore[[opponent_name]][["TO"]], na.rm = TRUE)
    )
    
    # Append the game summary to the list of results
    game_stats[[length(game_stats) + 1]] <- game_summary
  }
  
  # Combine all game stats into a single data frame
  game_stats_df <- bind_rows(game_stats)
  
  return(game_stats_df)
}

# Example usage:
game_ids <- all_schedules_df$game_id  # Replace with actual game IDs
game_stats_df <- get_game_stats(game_ids)

# View results
head(game_stats_df)
