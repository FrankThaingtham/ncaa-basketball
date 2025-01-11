# Install and load the caret package
install.packages("caret")
library(caret)

# Set up a grid of parameters to tune, including n.minobsinnode
tune_grid <- expand.grid(
  n.trees = c(100, 200, 500),  # Number of trees in the model
  interaction.depth = c(3, 4, 5),  # Maximum depth of trees
  shrinkage = c(0.01, 0.05, 0.1),  # Shrinkage (learning rate)
  n.minobsinnode = c(5, 10)  # Minimum number of observations in terminal nodes
)

# Perform cross-validation with caret's train function
train_control <- trainControl(method = "cv", number = 5)  # 5-fold cross-validation
gbm_tuned <- train(
  point_spread ~ ., 
  data = train_data, 
  method = "gbm", 
  trControl = train_control, 
  tuneGrid = tune_grid
)

# View the best tuning parameters
print(gbm_tuned$bestTune)

# Check the formula used in the model
summary(gbm_model)
