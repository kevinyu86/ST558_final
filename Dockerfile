# start from the rstudio/plumber image
FROM rocker/r-ver:4.4.1

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y  libssl-dev  libcurl4-gnutls-dev  libpng-dev libsodium-dev libxml2-dev zlib1g-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev  libfreetype6-dev libtiff5-dev libjpeg-dev 
    
# install plumber, GGally
RUN R -e "install.packages('GGally')"
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('caret')"
RUN R -e "install.packages('rpart')"
RUN R -e "install.packages('Metrics')"
RUN R -e "install.packages('randomForest')"

# copy everything from the current directory into the container
COPY API.R API.R
COPY diabetes_binary_health_indicators_BRFSS2015.csv diabetes_binary_health_indicators_BRFSS2015.csv

# open port to traffic
EXPOSE 8000

# when the container starts, start the API.R script
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('API.R'); pr$run(host='0.0.0.0', port=8000)"]
