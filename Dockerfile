# start from the rstudio/plumber image
FROM rocker/r-ver:4.4.1


# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# create the application folder
RUN mkdir -p ~/application

# copy everything from the current directory into the container
COPY "/" "application/"
WORKDIR "application/"

# open port 80 to traffic
EXPOSE 8000

# install plumber
RUN R -e "install.packages('plumber')"

# when the container starts, start the API.R script
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('API.R'); pr$run(host='0.0.0.0', port=8000)"]
