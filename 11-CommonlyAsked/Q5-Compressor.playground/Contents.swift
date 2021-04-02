import UIKit

/*
 ___
/ __|___ _ __  _ __ _ _ ___ ______ ___ _ _
|(__/ _ \ '  \| '_ \ '_/ -_|_-<_-</ _ \ '_|
\___\___/_|_|_| .__/_| \___/__/__/\___/_|
              |_|
 
 // Challenge: Give a string with repeating characters (i.e. "aaabb") write
 // an algorithm that will compress the string down to the character, followed
 // by the number of times it appears in the string (i.e "a3b2").
 // If the compressed string is not smaller than original, return original.

 */

func compress(_ str: String) -> String {
    var compressed = ""
    var count = 0
    let chars = Array(str)
    
    for i in 0..<str.count {
        count += 1
        // If we are at the end of our string
        // or if next char different, append this result
        if i + 1 >= str.count || chars[i] != chars[i + 1] {
            compressed.append(chars[i])
            compressed.append(String(count))
            count = 0
        }
    }
    
    // Return the original string if shorter, or the compressed if longer
    return compressed.count < str.count ? compressed : str
}

compress("aaabb")           // a3b2
compress("aabb")            // aabb
compress("ab")              // ab
compress("abc")             // abc
compress("zzz")             // z3
compress("aabbaabb")        // aabbaabb (not shorter)
