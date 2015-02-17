# OVERALL DESCRIPTION
# makeCacheMatrix and cacheSolve functions calculate the inverse of a given matrix. 
# The makeCacheMatrix can be seen as a "data structure" that stores the matrix and its inverse.
# It offers appropriate setter and getter functions for storing the matrix and its inverse.
# The cacheSolve function uses makeCacheMatrix. It returns the inverse of the matrix stored in makeCacheMatrix.
# If the inverse has already been calculated and cached in makeCacheMatrix, then the cached inverse is returned. 


##
# Offers a "data structure" that stores a square matrix and its inverse. 
# Setter and getter functions are offered for both matrix and inverse.
# Parameter x:  a square matrix, e.g. (2 x 2)
# Return value: a list of functions, i.e. setters and getters for the matrix and its inverse
## 
makeCacheMatrix <- function(x = matrix()) {

    # Initialize empty inverse variable 
    inverse <- NULL
    
    # Set new matrix. As a consequence "delete" cached inverse value by setting variable 'inverse' to NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    
    # Get matrix
    get <- function() x
    
    # Set inverse
    setInverse <- function(i) inverse <<- i
    
    # Get inverse
    getInverse <- function() inverse
    
    # Return a list of functions
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}



##
# Calculates the inverse of a given matrix. If cached inverse value for given matrix is available, 
# it retrieves the inverse from the cache instead of re-calculation.
# Parameter x:      object of makeCacheMatrix that stores the matrix whose inverse needs to be calculated
# Return value:     inverse of a given matrix
##
cacheSolve <- function(x, ...) {
        
    # Get the inverse
    inverse <- x$getInverse()
    
    # Check if cached inverse exists. If true, return cached data and stop further processing. 
    if(!is.null(inverse)) {
        message("***Cached inverse available. Retrieving cached inverse data: ***")
        return(inverse)
    }
    
    # If cached inverse is not available, get matrix data
    matrix <- x$get()
    
    # Calculate inverse using function 'solve()'
    inverse <- solve(matrix, ...)
    
    # Cache calculatd inverse
    x$setInverse(inverse)
    
    # Return inverse of matrix 
    inverse    
}
