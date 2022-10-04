import UIKit

/*
 _   _      _                ___ _
| | | |_ _ (_)__ _ _  _ ___ / __| |_  __ _ _ _ ___
| |_| | ' \| / _` | || / -_) (__| ' \/ _` | '_(_-<
 \___/|_||_|_\__, |\_,_\___|\___|_||_\__,_|_| /__/
                |_|

 Challenge: Given a string, see if you can detect whether it contains only unique chars.
 
 */

/*
 Solution:
 
  There are lots of ways we could solve this:
       - HashMap where we store every character and a boolean on whether found
       - An array that counts the number of times a character occurs
 */

// Complexity O(n)
func isUnique(_ text: String) -> Bool {
    var foundChars = [Character:Bool]()
    let chars = Array(text)

    for c in chars {
        if foundChars[c] != nil { // Already found
            return false
        }
        foundChars[c] = true
    }
    return true
}

// Complexity O(1) 
func isUniqueCount(_ text: String) -> Bool {

    let arrayСhar = Array(text)
    let noDuplicates = Set(text)
    
    if arrayСhar.count == noDuplicates.count {
        return true
    }
    
   return false
}

isUnique("ab")
isUnique("aa")
isUnique("abcdefghijklmnopqrstuvwxyz")

isUniqueCount("ab")
isUniqueCount("aa")
isUniqueCount("abcdefghijklmnopqrstuvwxyz")
