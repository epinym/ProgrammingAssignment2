
# The makeCacheMatrix() function creates 4 subfunctions and also two cache 
# variables, one cache variable 'm' to store the matrix passed to the function 
# when creating an instance, and another variable 'inv' to store the 
# "computationally expensive" inverse matrix of 'm', once that inverse is
# calculated and set. The inverse is *not* calculated by the makeCacheMatrix()
# function, but rather calculated (as needed) by the cacheSolve() function
# below.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        # 'inverse' in the context function(inverse) is the inverse() function
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


# The cacheSolve() function will do one of two things:
#       1. retreive the inverse if already calculated (via x$getinverse())
#       2. calculate the inverse using solve(), 
#               then save/cache it via x$setinverse, 
#               then return the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}

