#install.packages("devtools")
#devtools::install_github("lbenz730/ncaahoopR")

#load package
library(ncaahoopR)

# look at a team's schedule
get_schedule("Duke", "2022-23") %>%
  glimpse()

pt_df = NULL

#Basic prediction
for(teamName in c("Duke", "UNC", "NC State")) {
  pt_df = rbind(pt_df, get_schedule(teamName, "2022-23") %>%
                  filter(date < "2023-01-01") %>% # look at only Fall games
                  summarize(mean_pts = mean(team_score),
                            var_pts = var(team_score)) %>%
                  mutate(team = teamName))
}

pt_df
#And the point spread 
getCI95 = function(m, s) {
  return(toString(
    c(m - (qnorm(0.975) * s), m + (qnorm(0.975) * s))
  ))
}

lookup <- c(team1 = "V1", team2= "V2")

combn(pt_df$team, 2) %>%
  t() %>%
  as.data.frame() %>%
  rename(all_of(lookup)) %>%
  rowwise() %>%
  mutate(pt_spread = 
           pt_df$mean_pts[pt_df["team"] == team1] - 
           pt_df$mean_pts[pt_df["team"] == team2]) %>%
  mutate(spread_sd = 
           sqrt(pt_df$var_pts[pt_df["team"] == team1] +
                  pt_df$var_pts[pt_df["team"] == team2])) %>%
  mutate(spread_CI_95 = getCI95(pt_spread, spread_sd)) %>%
  select(-spread_sd)







