import UIKit

/*
 ___ _      _ _         _
| _ \ |__ _| (_)_ _  __| |_ _ ___ _ __  ___ ___
|  _/ / _` | | | ' \/ _` | '_/ _ \ '  \/ -_|_-<
|_| |_\__,_|_|_|_||_\__,_|_| \___/_|_|_\___/__/

 // Challenge: Detect if a given string is a palindrome.
 // A palindrome is a word that can be spelt the same way forwards and backwards.

 */

func isPalindrome(_ text: String) -> Bool {
    let chars = Array(text)
    let length = chars.count
    
    for i in 0..<length / 2 {
        if chars[i] != chars[length - i - 1] {
            return false
        }
    }
    return true
}

isPalindrome("abba")
isPalindrome("mom")
isPalindrome("dad")
isPalindrome("radar")
isPalindrome("rush")
isPalindrome("yes")

// If your interviewer is OK, you could also do this.
// But best to know above trick in case they want you to do manually.
func isPalindromeSimple(_ value: String) -> Bool {
    return value == String(value.reversed())
}

