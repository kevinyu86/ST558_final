# EDA_Modeling_API

## 1. Introduction

### 1.1 Dataset

Diabetes \_ binary \_ health \_ indicators Dataset is a clean dataset of 253,680 survey responses to the CDC's BRFSS2015. The target variable Diabetes_binary has 2 classes. 0 is for no diabetes, and 1 is for prediabetes or diabetes. This dataset has 21 feature variables which have been reported can influencing diabetes disease and other chronic health conditions based on diabetes disease research.

Among all variables, I tried to select features, which I thought could be important risk factors for diabetes and other chronic illnesses.

### 1.2 Modeling

The ultimate goal of modeling is to develop a predictive models that accurately captures the relationship between input features (response variables) and the target variable (diabetes here) to make reliable predictions on new, unseen data.

As the target variable in this project is a binary classification variable, we will use three type of models:

-   **Logistic Regression** Logistic regression is a linear model used for binary classification. It predicts the probability that an observation belongs to a particular class.

-   **Classification Trees** Classification trees split the data into subsets based on the value of input features, creating a tree-like model of decisions.

-   **Random Forest** Random Forest is an ensemble method that combines multiple decision trees, each trained on a random subset of the data and features.

### 1.3 LossLog metric

In this study, the logLoss will be used as metric to select the best models. LogLoss, also known as logistic loss or cross-entropy loss, is a performance metric for evaluating the predictions of classification models, particularly in binary classification tasks. It measures the accuracy of the probabilistic predictions by comparing the predicted probabilities to the actual class labels. Mathematically, log loss is defined as the negative average of the log of the predicted probabilities assigned to the true classes. Unlike accuracy, which only considers whether the predicted class matches the actual class, log loss takes into account the confidence of the predictions. This is particularly important when dealing with imbalanced datasets or when the cost of misclassification varies. By penalizing incorrect predictions more heavily when the model is confident about them, log loss provides a more nuanced and informative evaluation of model performance. This helps in understanding not just whether the model is correct, but how confident it is in its predictions, leading to better model calibration and more reliable decision-making.

