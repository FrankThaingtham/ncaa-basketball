#Fixed issues where in unc_all_game_stats (duke and nc state also). Sometime UNC or in opponent instead of team.
#Hope it will help with combining it to schedule with point and home and stuff.
#UNC 
df_team_unc <- unc_all_game_stats[unc_all_game_stats$team_name == "North Carolina", ]
df_opponent_unc <- unc_all_game_stats[unc_all_game_stats$opponent_name == "North Carolina", ]

df_opponent_unc <- df_opponent_unc %>%
  rename_with(~ sub("opponent_", "temp_", .), starts_with("opponent_")) %>%
  rename_with(~ sub("team_", "opponent_", .), starts_with("team_")) %>%
  rename_with(~ sub("temp_", "team_", .), starts_with("temp_")) %>%
  mutate(team_name = "North Carolina", opponent_name = opponent_name)

df_fixed_unc <- bind_rows(df_team_unc, df_opponent_unc)

#Duke 
df_team_duke <- duke_all_game_stats[duke_all_game_stats$team_name == "Duke", ]
df_opponent_duke <- duke_all_game_stats[duke_all_game_stats$opponent_name == "Duke", ]

df_opponent_duke <- df_opponent_duke %>%
  rename_with(~ sub("opponent_", "temp_", .), starts_with("opponent_")) %>%
  rename_with(~ sub("team_", "opponent_", .), starts_with("team_")) %>%
  rename_with(~ sub("temp_", "team_", .), starts_with("temp_")) %>%
  mutate(team_name = "Duke", opponent_name = opponent_name)

df_fixed_duke <- bind_rows(df_team_duke, df_opponent_duke)

#NC State 
df_team_ncstate <- ncstate_all_game_stats[ncstate_all_game_stats$team_name == "NC State", ]
df_opponent_ncstate <- ncstate_all_game_stats[ncstate_all_game_stats$opponent_name == "NC State", ]

df_opponent_ncstate <- df_opponent_ncstate %>%
  rename_with(~ sub("opponent_", "temp_", .), starts_with("opponent_")) %>%
  rename_with(~ sub("team_", "opponent_", .), starts_with("team_")) %>%
  rename_with(~ sub("temp_", "team_", .), starts_with("temp_")) %>%
  mutate(team_name = "NC State", opponent_name = opponent_name)

df_fixed_ncstate <- bind_rows(df_team_ncstate, df_opponent_ncstate)



