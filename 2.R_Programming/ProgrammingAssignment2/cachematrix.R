# Computes inverse of a matrix and caches the result.
#
# Example
# 1)create 3x3 matrix using random values
#   m <- matrix(rnorm(9),3,3)
# 2)create "special" matrix
#   sm <- makeCacheMatrix(m)
# 3)compute inverse first time
#   inverseMatrix <- cacheSolve(sm)
# 4) compute inverse second time, data already in cache
#   inverseMatrix <- cacheSolve(sm)

#This function creates a special "matrix" object that can cache its inverse. A special "matrix" is a list of functions:
#   setMatrix - set the value of the matrix
#   getMatrix - get the value of the matrix
#   setInverseMatrix - sets the value of the inverse matrix
#   getInverseMatrix - gets the value of the inverse matrix
makeCacheMatrix <- function(matrix = matrix()) {
  inverseMatrix <- NULL
  
  setMatrix <- function(x) {
    matrix <<- x
    inverseMatrix <<- NULL
  }
  getMatrix <- function() {
    matrix
  }
  
  setInverseMatrix <- function(x) {
    inverseMatrix <<- x
  }
  getInverseMatrix <- function() {
    inverseMatrix
  }
  
  list(
    setMatrix = setMatrix, getMatrix = getMatrix, setInverseMatrix = setInverseMatrix, getInverseMatrix = getInverseMatrix
  )
}

#This function computes the inverse of the special "matrix" obtained by makeCacheMatrix function above.
#If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(cmatrix, ...) {
  inverseMatrix <- cmatrix$getInverseMatrix()
  if (!is.null(inverseMatrix)) {
    message("getting cached data")
    return(inverseMatrix)
  }
  matrix <- cmatrix$getMatrix()
  inverseMatrix <- solve(matrix, ...)
  cmatrix$setInverseMatrix(inverseMatrix)
  return(inverseMatrix)
}
