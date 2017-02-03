## Put comments here that give an overall description of what your
## functions do
## The makeCacheMatrix() function creates a special object that stores a matrix and caches its inverse.
## The cacheSolve() function takes an argument that is returned by makeCacheMatrix() to test the inverse
## from the cache value that is stored in the makeCacheMatrix() objest's environment.


## programming assignment 2: Lexical scoping

## Write a short comment describing this function
## This function builts a set of functions and returns the functions within a list to the parent environment.
## initialized object x, set an empty matrix as it's default value, as function argument in function makeCacheMatrix().
makeCacheMatrix <- function(x = matrix()) {
## initialized object s in the makeCacheMatrix() environment, set its value to NULL, to be used by later code in the function.  
          s <- NULL
## define the setter() function to set the value of the matrix         
          set <- function(y) {
## using the <<- operator to assign the input argument to x of it's parent environment.            
          x <<- y
## set the value of NULL to the s object in the parent environment.         
          s <<- NULL
      }
## define the getter() function of matrix x.
## R, according to lexical scoping rule, will retrieves the value of x from the parent environment.           
          get <- function() x
## defin ethe function of the inverse, the <<- operator assigns the input argument to the value of s of the parent environment.          
          setinverse <- function(solve) s <<- solve 
## set the getter for inverse s         
          getinverse <- function() s
## assigning the setter and getter functions in a list to return to the parent environment.          
          list(set = set, get = get,
          setinverse = setinverse, 
          getinverse = getinverse)
}


## Write a short comment describing this function
## The CacheSolve() function tests the inverse of the matrix returned by the above function.
cacheSolve <- function(x, ...) {
## get the inverse value of the matrix
## Because list elements in makeCacheMatrix() are defined with names, we can access these functions with the $ extract operator.
          s <- x$getinverse()
## test if the value existed          
          if (!is.null(s)){
## return message when TRUE            
          message("getting cached data")
## return inverse value            
          return(s)
        }
## When FALSE get new data        
          data <- x$get()
## calculate inverse          
          s <- solve(data, ...)
## set new value          
          x$setinverse(s)
## output value          
          s
}
