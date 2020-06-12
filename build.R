if (file.exists(".env")) dotenv::load_dot_env()

# This is a part of an example of a microservice.
# build.R file is used as an "installation" file - it's in a way buidling our
# app. Now it consists in most cases of two parts:
# 

# Part 1 - securing dependencies -------------------------------------------


# where we're setting up a microsoft repository snapshot to control your
# packages versions (well, it doesn't resolve every issue with R's environment
# control, but it resolves two issues:
# 1) it's a very good and much simpler alternative to the packrat package
# 2) it is useful to make sure that we're getting our packages 
#    from the same MRAN stage as a rocker does
message("Setting Microsoft repository")
r = getOption("repos") 
r["CRAN"] = "https://mran.microsoft.com/snapshot/2018-12-20"
options(repos = r)

# Part 2 - installing packages --------------------------------------------


# NOW it is HIGHLY recommended to create some basic image that'll contain all
# the packages you're pretty sure you won't make changes in (e.g. magrittr - are
# you planning to mess around with the magrittr's source code? No? I thought so.).
# Why? Because the buidling time when you get all the packages is 
# so goddamn loooooooooooooooooong that you can literally fall asleep 
# during the build.

# 
# In my projects I'm always buidling a set of basic images with some
# preinstallations. E.g. many packages need curl to work so the image needs to 
# contain libcurl4-openssl-dev system library. So I'm building something like 
# base-image-r image and the refer to it in the Dockerfile.
# 
# You should however install here every package that will need to be changed 
# many times (oh yeah, it will)
install.packages("pkgs/mainpkg", repos = NULL, dependencies = FALSE, type = "source")
# install.packages("pkgs/somepackage", repos = NULL, dependencies = FALSE, type = "source")
# install.packages("pkgs/somepackage", repos = NULL, dependencies = FALSE, type = "source")
