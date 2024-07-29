# read in data
df <- read.csv("diabetes_binary_health_indicators_BRFSS2015.csv")

# select variables 
diab_df <- df |>
  select(Diabetes_binary, HighBP, HighChol, Smoker, BMI, Veggies, HvyAlcoholConsump, DiffWalk, Sex, Age) |>
  mutate(Diabetes_binary = factor(Diabetes_binary,
                                  levels = c(0, 1),
                                  labels = c("no_diabetes", "prediabetes"))) |>
  mutate(HighBP = factor(HighBP,
                         levels = c(0, 1),
                         labels = c("no_high", "high_BP"))) |>
  mutate(HighChol = factor(HighChol,
                           levels = c(0, 1),
                           labels = c("no_high_cholesterol", "high_cholesterol"))) |>
  
  mutate(Smoker = factor(Smoker,
                         levels = c(0, 1),
                         labels = c("no", "yes"))) |>
  
  mutate(Sex = factor(Sex,
                      levels = c(0, 1),
                      labels = c("female", "male"))) |>
  mutate(Age = factor(Age,
                      levels = c(1:13),
                      labels = c("Age_18_to_24", "Age_25_to_29", "Age_30_to_34", "Age_35_to_39", "Age_40_to_44", "Age_45_to_49", "Age_50_to_54", "Age_55_to_59", "Age_60_to_64", "Age_65_to_69", "Age_70_to_74", "Age_75_to_79", "Age_80_or_older")))

# fit the best model

ct_model <- rpart(Diabetes_binary ~ ., 
                  data = diab_df, 
                  cp = 0.011)


