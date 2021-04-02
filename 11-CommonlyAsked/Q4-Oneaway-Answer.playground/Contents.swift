import UIKit

/*
 
 ___
/ _ \ _ _  ___ __ ___ __ ____ _ _  _
|(_) | ' \/ -_) _` \ V  V / _` | || |
\___/|_||_\___\__,_|\_/\_/\__,_|\_, |
                                |__/

  Challenge: There are three types of edits that can be performed on strings:
  - insert a character
  - remove a character, or
  - replace a character.
 
  Given two strings, write a function to check if they are one or zero edits away.

 */

func oneAway(_ first: String, _ second: String) -> Bool {
    // Let's break this down.
    // If the strings differ by > 1 length, they are not one replacement away
    // If the strings are the same length,  they are one replacement away
    // If the strings differ by one,        they may be one edit or insert away
    // If the strings differ by one less,   they may be one edit or insert away

    if abs(first.count - second.count) > 1 {
        return false
    } else if first.count == second.count {
        return oneEditReplace(first, second)
    } else if first.count + 1 == second.count {
        return oneEditInsert(first, second)
    } else if first.count - 1 == second.count {
        return oneEditInsert(second, first)
    }

    return true
}

// Check if you can insert a character into s1 to make s2
// Do this by comparing characters and pointers.
//
// For example:
//      pale
//      i
//      pble
//      j
//
// As soon as you detect that one of the characters doesn't match,
// compare the indexes. If they are the same, that's OK. That means
// this is your first check that doesn't match. Increment the other pointer.
// If the characters don't match again, and the pointers don't match,
// you know they are more than one away.

func oneEditInsert(_ s1: String, _ s2: String) -> Bool {
    var i = 0
    var j = 0
    
    let s1Chars = Array(s1)
    let s2Chars = Array(s2)
    
    while i < s1.count && j < s2.count {
        if s1Chars[i] != s2Chars[j] {
            if i != j {
                return false
            }
            j += 1
        } else {
            i += 1
            j += 1
        }
    }
    return true
}

// If we detect one difference - fine.
// If we detect another - more than one edit away.
func oneEditReplace(_ s1: String, _ s2: String) -> Bool {
    var foundDifference = false
    
    let s1Chars = Array(s1)
    let s2Chars = Array(s2)

    for i in 0..<s1.count {
        if s1Chars[i] != s2Chars[i] {
            if foundDifference {
                return false
            }
            foundDifference = true
        }
    }
    return true
}
oneAway("pale", "paleXXXX")     // false
oneAway("pale", "ple")          // true
oneAway("pales", "pale")        // true
oneAway("pale", "bale")         // true
oneAway("pale", "bake")         // false
oneAway("pale", "bakeerer")     // false
