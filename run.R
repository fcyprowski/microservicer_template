# This is a part of an example of a microservice.
# run.R file runs the app by calling a plumber function. In most cases you'll
# be only using it to call some packages with library that contains special
# operators (like magrittr and it's %>% or future and %<-%). But there are a number
# of cases when reading something at the RUN level is more efficient. For example
# your service may need to use a big data file or you need to develop a very
# time efficient app. In that case it's better to read it here than on the APP
# level.
# 
# This line of code gets you all the necessary environmental variables written
# in the .env file. Remember that the env file shouldn't be in the Docker image
# when pushing a service to production. However it's written in the
# .dockeringore file, so you don't have to worry about it as long as you'll not
# decide to change the name of your env file :)
if (file.exists(".env")) dotenv::load_dot_env() 
# The service is using '%>%' sign so it's kinda wise to call the library here.
library(magrittr)
# Now here's the deal - you could avoid calling the packages here when you follow
# all the best pracitces from Hadley Wickham's guide. 
# "(...) when building a package you should NEVER use either (library|require) 
# inside a package (...)"
# http://r-pkgs.had.co.nz/package.html
# However I find it really useful to call all the tidyverse packages here - as long
# as you remember that it's better to pack all the service calls/operations into
# a package that resides in the "pkgs/ directory and use it only in special cases
# (e.g. the deadline is so near you'd be literally dead in a minut). E.g. the function
# "filter" can be misinterpreted by R when calling MASS and dplyr at the same time :(
# Still - it simplifies a lot. I'm being realistic here.
# 
# All set? Run the app!
plumber::plumb('app.R')$run(port = 5000, host = '0.0.0.0')
