import Foundation

/*
 You are given in undirected graph consisting of N vertices, numbered from 1 to N, and M edges.
 
 The graph is described by two arrays, A and B, both of length M. A pair A[K] and B[K] for K from 0 to M-1, describe the edge between vertex A[K] and vertex B[K].
 
 Your task is to check whether the given graph contains a path from vertex 1 to vertex N going through all the vertices, one-by-one, in increasing order of the numbers. All connections on the path should be direct.
 
 Write a function, that given an integer N and two arrays A and B of M integers each, returns true if there exists a path from vertex 1 to N going through all vertices, one-by-one, in increasing order, or false other wise.
 
 Example 1:

          ┌─────┐
   ┌──────│  3  │──────┐
   │      └─────┘      │
   │         │         │
┌─────┐      │      ┌─────┐
│  2  │      │      │  4  │
└─────       │      └─────┘
   │      ┌─────┐      │
   └──────│  1  │──────┘
          └─────┘
 
 Given N = 4
       A = [1, 2, 4, 4, 3]
       B = [2, 3, 1, 3, 1]
       Function should return true.
 
 There is a path (1 > 2 > 3 > 4) using edges (1, 2), (2, 3), (4, 3).
 
 Example 2:

          ┌─────┐
   ┌──────│  4  │──────┐
   │      └─────┘      │
   │         │         │
┌─────┐      │      ┌─────┐
│  2  │      │      │  3  │
└─────       │      └─────┘
   │      ┌─────┐      │
   └──────│  1  │──────┘
          └─────┘
 
 Given N = 4
       A = [1, 2, 1, 3]
       B = [2, 4, 3, 4]
       Function should return false.
 
 There is no path (1 > 2 > 3 > 4) as there is no direct connection from vertex 2 to vertex 3.
 
 Example 3:

 ┌─────┐
 │  1  │
 └─────┘
                             
┌─────┐    ┌─────┐    ┌─────┐   ┌─────┐    ┌─────┐
│  2  │────┤  3  │────│  4  │───│  5  │────│  6  │
└─────┘    └─────┘    └─────┘   └─────┘    └─────┘
 
 Given N = 6
       A = [2, 4, 5, 3]
       B = [3, 5, 6, 4]
       Function should return false.
  
 Example 4:

 ┌─────┐    ┌─────┐    ┌─────┐
 │  1  │────┤  2  │────│  3  │
 └─────┘    └─────┘    └─────┘

 Given N = 3
       A = [1, 3]
       B = [2, 2]
       Function should return true.

 
 Example 5:

 ┌─────┐    ┌─────┐    ┌─────┐
 │  2  │────┤  3  │────│  4  │
 └─────┘    └─────┘    └─────┘
 
 Given N = 3
       A = [2, 3]
       B = [3, 4]
       Function should return false.

 */

func solution(_ A: [Int], _ B: [Int]) -> Bool {
    return false
}

solution([], []) // false
solution([1], [2]) // true
solution([1, 3], [2, 2]) // true
solution([1, 3], [2, 99]) // false
solution([2, 3], [3, 4]) // false
solution([1, 2, 4, 4, 3], [2, 3, 1, 3, 1]) // true
solution([1, 2, 1, 3], [2, 4, 3, 4]) // false
solution([2, 4, 5, 3], [3, 5, 6, 4]) // false
