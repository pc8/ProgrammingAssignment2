# This file demonstrates how makeCacheMatrix and cacheSolve are used. 

source("cachematrix.R")

mymatrix<-matrix(c(1,2,3,4), nrow=2, ncol=2)

x<-makeCacheMatrix(mymatrix)

message("Following 2x2 matrix is stored: ")
print(x$get())


message("Trigger calculation of inverse - 1st time: ")
print(cacheSolve(x))

message("Trigger calculation of inverse - 2nd time - cached value must be retrieved: ")
print(cacheSolve(x))

message("Checking if matrix %*% its inverse equals the identity matrix: ")
print(cacheSolve(x) %*% mymatrix)

mymatrix2<-matrix(c(0,3,3,0,4,0,-1,5,0), nrow=3, ncol=3)

x$set(mymatrix2)

message("Following 3x3 matrix is stored: ")
print(x$get())

message("Trigger calculation of inverse - 1st time: ")
print(cacheSolve(x))

message("Trigger calculation of inverse - 2nd time - cached value must be retrieved: ")
print(cacheSolve(x))

message("Checking if matrix %*% its inverse equals the identity matrix: ")
print(cacheSolve(x) %*% mymatrix2)