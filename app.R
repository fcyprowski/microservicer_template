# This is a part of an example of a microservice.
# app.R file is a file with REST API endpoints based on *plumber* package.
# You should put here every line of code that should be called whenever you send
# a request to your service.
# For the sake of this example, suppose we have a GET method that gets the
# sample of the iris dataset in the request's body and returns predictions.
# Please notice that it's not a perfect machine learning deployment - e.g. you
# shouldn't read a model from inside of the microservice. It's better to use a
# storage (maybe Google Cloud Storage, AWS S3, a good old HDFS or even persistent 
# storage disk managed by Kubernetes if you're advanced enough). Containers are
# from definition ephemerical, so every change on them will be lost on every
# single error/redeployment and so on.

#* @serializer unboxedJSON
#* @get /predictions
#* @param input ExAMPLE INPUT IS IN THE "example_input.json"
function(req) {
  input = req$postBody  # please refer to the plumber docs here:
                        # https://www.rplumber.io/docs/routing-and-input.html#endpoints
                        # Chapter 3.6: Input handling
  # the function is from the mainpkg written just for this service.
  # See the *mainpkg* package in the ./pkgs/ directory
  mainpkg::logg("Returning predictons for", nrow(input), "rows")
  # BEWARE! If you don't set the env variable the service won't throw an error
  # It's a good practice to validate the existence of such variables like below.
  # Well if you don't want to debug this shit to the rest of your life.
  creator = Sys.getenv("CREATOR")
  if (creator == "") stop("CREATOR variable not set!")
  mainpkg::logg("It should work,", creator)
  # ^ maybe it's better to run such validations in the run.R file
  # now do the predictions
  readRDS("data/model.rds") %>%
    predict(input)
}
