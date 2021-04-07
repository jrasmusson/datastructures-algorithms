import UIKit

/*
 ___            _              _
| __|_ _ __ ___| |__  ___  ___| |__
| _/ _` / _/ -_) '_ \/ _ \/ _ \ / /
|_|\__,_\__\___|_.__/\___/\___/_\_\

 Determine which elements intersect between two given arrays.
 
 */

func intersectBrute(_ A: [Int], _ B: [Int]) -> [Int] {
    var result = [Int]()
    
    // O(n)
    for a in A {
        // O(m)
        for b in B {
            if a == b {
                result.append(a)
            }
        }
    }
    return result
}

intersectBrute([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]

func intersect(_ A: [Int], _ B: [Int]) -> [Int] {
    
    // create two pointers and loop through both arrays
    // if one element is less than the other...
    //   increment the lower pointer
    // if elements are equal collect
    // then increment either of the pointers
    
    var result = [Int]()
    
    var i = 0; let m = A.count
    var j = 0; let n = B.count
    
    // O(n + m)
    while i < m && j < n {
        if A[i] < B[j] {
            i += 1
        } else if B[j] < A[i] {
            j += 1
        } else {
            result.append(A[i])
            i += 1
        }
    }
    
    return result
}

intersect([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]
