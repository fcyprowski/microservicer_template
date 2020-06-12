logg = function(type = "INFO", ...) {
  message(type, Sys.time(), ":", ...)
}
