@echo off

docker build -t custom-rocker-example .

start http://localhost:8787

docker run -e PASSWORD="rstudio" -p 8787:8787 ^
-v "%cd%\..":/home/rstudio/output ^
--rm custom-rocker-example
