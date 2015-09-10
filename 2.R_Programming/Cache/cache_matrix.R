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
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setInverseMatrix = setInverseMatrix,
       getInverseMatrix = getInverseMatrix)
}

cacheSolve <- function(cmatrix, ...) {
  inverseMatrix <- cmatrix$getInverseMatrix()
  if(!is.null(inverseMatrix)) {
    message("getting cached data")
    return(inverseMatrix)
  }
  matrix <- cmatrix$getMatrix()
  inverseMatrix <- solve(matrix, ...)
  cmatrix$setInverseMatrix(inverseMatrix)
  return(inverseMatrix)
}