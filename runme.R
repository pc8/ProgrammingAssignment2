source("cachematrix.R")

mymatrix<-matrix(c(1,2,3,4), nrow=2, ncol=2)

x<-makeCacheMatrix(mymatrix)

print("Following 2x2 matrix is stored: ")
print(x$get())

print("Trigger calculation of inverse - 1st time: ")
print(cacheSolve(x))

print("Trigger calculation of inverse - 2nd time - cached value: ")
print(cacheSolve(x))

x$set(matrix(c(0,3,3,0,4,0,-1,5,0), nrow=3, ncol=3))

print("Following 3x3 matrix is stored: ")
print(x$get())

print("Trigger calculation of inverse - 1st time: ")
print(cacheSolve(x))

print("Trigger calculation of inverse - 2nd time - cached value: ")
print(cacheSolve(x))