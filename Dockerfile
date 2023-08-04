FROM rocker/tidyverse:latest

COPY .config /home/rstudio/.config
COPY .Rprofile /home/rstudio/

USER root
RUN chown -R rstudio:rstudio /home/rstudio/

RUN install2.r --error --deps TRUE \
    usethis \
    testthat \
    magick \
    urltools \
    markdown \
    text2vec \
    qpdf \
    devtools \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN apt-get clean && apt-get -y update && apt-get install -y --no-install-recommends libxt6 imagemagick
