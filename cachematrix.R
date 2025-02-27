## cachematrix.R
## This script contains two functions that cache the inverse of a matrix to improve performance.

## makeCacheMatrix: This function creates a special "matrix" object that can store its inverse.
## It includes methods to set and get the matrix, as well as to set and get the cached inverse

makeCacheMatrix <- function(x = matrix()) { inv <- NULL  # Initialize inverse as NULL
    
    # Set the matrix and reset cached inverse
    set <- function(y) {
        x <<- y
        inv <<- NULL

}
# Get the matrix
    get <- function() x
    
    # Set the inverse
    setInverse <- function(inverse) inv <<- inverse
    
    # Get the inverse
    getInverse <- function() inv
    
    # Return a list of functions
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}

## cacheSolve: This function computes the inverse of the special "matrix" created by makeCacheMatrix.
## If the inverse has already been calculated and stored in the cache, it retrieves the cached value 
## instead of recomputing it

cacheSolve <- function(x, ...) { inv <- x$getInverse()  # Check if inverse is already cached
    
    if (!is.null(inv)) { 
        message("Getting cached inverse")
        return(inv)  # Return cached inverse if available
        
}
mat <- x$get()  # Get the matrix
    inv <- solve(mat, ...)  # Compute the inverse
    x$setInverse(inv)  # Cache the inverse
    inv  # Return the computed inverse
}
