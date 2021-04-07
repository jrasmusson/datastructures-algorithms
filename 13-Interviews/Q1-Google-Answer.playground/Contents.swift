import UIKit

/*
 ___                _
/ __|___  ___  __ _| |___
|(_ / _ \/ _ \/ _` | / -_)
\___\___/\___/\__, |_\___|
              |___/

 // https://www.youtube.com/watch?v=XKu_SEDAykw&ab_channel=LifeatGoogle
 
 Given a set of numbers, determine if there is a pair that equals a given sum.
 
 */

func hasPairWithSumBrute(_ data: [Int], _ sum: Int) -> Bool {
    // progressively walk - O(n^2)
    for i in 0..<data.count {
        for j in i + 1..<data.count {
            if data[i] + data[j] == sum {
                return true
            }
        }
    }
    
    return false
}

hasPairWithSumBrute([1, 2, 4, 9], 8)     // false
hasPairWithSumBrute([1, 2, 4, 4], 8)     // true
hasPairWithSumBrute([1, 2, 4], 8)        // false

func hasPairWithSum(_ data: [Int], _ sum: Int) -> Bool {
    
    // Store the complement in a Set
    var comp = Set<Int>()
    
    for value in data { // O(n)
        // And then add it if we haven't seen it
        print("Have we seen \(value)'s complement \(sum - value) before?")
        if comp.contains(value) {
            print("Yes we have - match ✅.")
            return true
        }
        print("No we have not. Add it.")
        comp.insert(sum - value)
    }
    return false
}

//hasPairWithSum([1, 2, 4, 9], 8)     // false
hasPairWithSum([1, 2, 4, 4], 8)     // true
//hasPairWithSum([1, 2, 4], 8)        // false
