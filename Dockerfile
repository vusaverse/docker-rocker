FROM rocker/tidyverse:latest

COPY .config /home/rstudio/.config
COPY .Rprofile /home/rstudio/
COPY renv.lock /home/rstudio/renv
COPY renv.lock renv.lock

USER root
RUN chown -R rstudio:rstudio /home/rstudio/
ENV RENV_PATHS_LIBRARY=/home/rstudio/renv

RUN install2.r --error --deps TRUE \
    usethis \
    testthat \
    magick \
    urltools \
    markdown \
    text2vec \
    qpdf \
    devtools \
    renv \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN apt-get clean && apt-get -y update && apt-get install -y --no-install-recommends libxt6 imagemagick cmake

RUN R -e "renv::restore()"
