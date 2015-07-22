## The first function, makeCacheMatrix(), allows us to initialize a matrix M and creates a list of functions (set, get, setinverse, getinverse) that allow us to interact with the cached matrix.

## The second function either computes the inverse of our cached matrix, or will return the matrix inverse if it has already been computed.


## The makeCacheMatrix() function:

## This function takes a matrix as its argument and caches it.  The function returns a list of functions that we can use to interact with the cached matrix: set(), get(), setinverse(), and getinverse().  

## The set() function gives us the opportunity to update the cached matrix.  The get() functions will return the cached matrix. The getinverse() function returns the cached inverse matrix (if it has not been computed yet it returns NULL). Finally, setinverse() allows us to override the cached inverse matrix. 

makeCacheMatrix<- function (M=matrix()) {
	inverse<-NULL
	
	set<-function(y) {
		M<<-y
		inverse<<-NULL
	}
	
	get<-function() {
		M
	}
	
	setinverse<-function(inv) {
		inverse<<-inv
	}
	
	getinverse<- function() {
		inverse
	}
	
	list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}



## The cacheSolve() function:

## If the inverse of our matrix has not been computed yet, we pass over the if-statement commands and use the solve() function to compute the inverse of the cached matrix. This inverse matrix is then cached using the setinverse() function defined in the makeCacheMatrix() function.  The inverse is now cached along with the original matrix.

# If the inverse of our matrix has already been cached using cacheSolve(), we enter the if-statment and return the cached inverse. It is important to note that in this case the solve() function is never called, saving time. 

cacheSolve<-function(X) {
	inverse<-X$getinverse()
	
	if (!is.null(inverse)) {
		message("Getting cached inverse")
		return(inverse)
	}
	
	matrix<-X$get()
	inverse<-solve(matrix)
	X$setinverse(inverse)
	
	inverse
}
