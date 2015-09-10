makeCacheDataStructure <- function(x) {
  cacheData <- NULL
  
  set <- function(y) {
    x <<- y
    cacheData <<- NULL
  }
  get <- function() {
    x
  }
  setCache <- function(y) {
    cacheData <<- y
  }
  getCache <- function() {
    cacheData
  }
  list(set = set, get = get,
       setCache = setCache,
       getCache = getCache)
}

cacheSolve <- function(cds, fun, ...) {
  cacheData <- cds$getCache()
  if(!is.null(cacheData)) {
    message("getting cached data")
    return(cacheData)
  }
  data <- cds$get()
  cacheData <- fun(data, ...)
  cds$setCache(cacheData)
  return(cacheData)
}