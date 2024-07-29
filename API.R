library(plumber)
library(tidyverse)
library(tidyr)
library(caret)
library(rpart)


# read in data
df <- read.csv("diabetes_binary_health_indicators_BRFSS2015.csv")

# select variables 
diab_df <- df |>
  select(Diabetes_binary, HighBP, HighChol, Smoker, BMI, Sex, Age) |>
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

# API function for pred endpoint
#* @get /pred
#* @param HighBP high blood pressure 0=no, 1=yes
#* @param HighChol high cholesterol 0=no, 1=yes
#* @param Smoker  0=no, 1=yes
#* @param BMI 
#* @param Sex  0=female, 1=male
#* @param Age 

function(HighBP=0, HighChol=0, BMI=28.4, Smoker=0, Sex=0, Age = 9) {
  # Create a new data frame with the input values
  new_data <- data.frame(
    HighBP = as.factor(HighBP),
    HighChol = as.factor(HighChol),
    BMI = BMI,
    Smoker = as.factor(Smoker),
    Sex = as.factor(Sex),
    Age = as.factor(Age),
  )
  
  # Make prediction
  prediction <- predict(model, new_data, type = "prob")
  
  # Convert prediction to class labels
  predicted_class <- ifelse(prediction > 0.5, "prediabetes", "no_diabetes")
  
  # Return the predicted class
  return(list(predicted_class = predicted_class))
}


# API function for info endpoint

#* @get /info
function(){
  "Xingwang Yu"
  "https://kevinyu86.github.io/ST558_final/"
}


