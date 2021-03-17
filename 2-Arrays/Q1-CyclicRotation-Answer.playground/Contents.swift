import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func solution(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    for _ in 1...K { // O(n)
        result = rotateRightOnce(A: result)
    }
    return result
}

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count - 1 { // O(n)
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    
    return newArray
}

rotateRightOnce(A: [0])
rotateRightOnce(A: [1, 2, 3])

solution(A: [], K: 0)
solution(A: [], K: 1)
solution(A: [-4], K: 0)
solution(A: [-4], K: 1)
solution(A: [1, 2, 3], K: 4)

solution(A: [1, 2, 3, 4, 5], K: 1)
solution(A: [1, 2, 3, 4, 5], K: 2)
solution(A: [1, 2, 3, 4, 5], K: 3)

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]

/*
 Using a stack
 */

func solutionStackRight(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }

    var result = A

    // treat like a stack and pop off first and add to end
    for _ in 1...K {
        let last = result.last! // O(1)
        result.insert(last, at: 0) // O(n)
        result.remove(at: A.count) // O(n)
    }

    return result
}

solutionStackRight(A: [1, 2, 3, 4, 5], K: 1)
solutionStackRight(A: [1, 2, 3, 4, 5], K: 2)
solutionStackRight(A: [1, 2, 3, 4, 5], K: 3)
solutionStackRight(A: [1, 2, 3, 4, 5], K: 4)

func solutionStackLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    // treat like a stack and pop off first and add to end
    for _ in 1...K {
        let first = result.first!
        result.append(first)
        result.remove(at: 0)
    }
    
    return result
}

solutionStackLeft(A: [1, 2, 3, 4, 5], K: 1)
solutionStackLeft(A: [1, 2, 3, 4, 5], K: 4)

