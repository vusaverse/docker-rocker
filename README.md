# docker-rocker

Custom Docker Rocker image for vusaverse.

# Windows
1. Start docker desktop
2. Clone / pull this repo
3. run `run.bat` in the main folder of repo via command line or double-click
4. RStudio will start in you default browser
5. Username and password are "rstudio"
6. Go in the top right corner to Project: (None)
7. Double click on 'output' in the pop-up 
8. Select the project-folder of your choice and the .Rproj within

# Linux
1. Clone / pull this repo
2. Navigate to the directory of the repository in the terminal 
3. run `sudo sh test_run.sh`
4. RStudio will start in you default browser
5. Username and password are "rstudio"
6. Go in the top right corner to Project: (None)
7. Double click on 'output' in the pop-up 
8. Select the project-folder of your choice and the .Rproj within

# Ansible playbook
We have provided a ansible playbook `rocker.yml`, which needs to be run with sudo right:
1. Run `sudo ansible-playbook rocker.yml` in the terminal
2. Open localhost:8787 in the browser

## Steps performed in the playbook
1. Install Docker
2. Clones the `vusaverse/docker-rocker` repository into a /tmp/ directory
3. Changes permission of the `test_run.sh` file (Chmod + x)
4. Runs the `test_run.sh` bash file
