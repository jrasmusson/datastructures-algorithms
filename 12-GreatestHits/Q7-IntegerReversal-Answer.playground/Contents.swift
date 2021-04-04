import UIKit

/*
 ___     _                      ___                          _
|_ _|_ _| |_ ___ __ _ ___ _ _  | _ \_____ _____ _ _ ___ __ _| |
 | || ' \  _/ -_) _` / -_) '_| |   / -_) V / -_) '_(_-</ _` | |
|___|_||_\__\___\__, \___|_|   |_|_\___|\_/\___|_| /__/\__,_|_|
                |___/
 
 // Challenge: Given an int, reverse its digits.
 // x = 123, return 321
 // x= -123, return -321

 */

func reverse(_ x: Int) -> Int {
    var x = x
    let isNegative = x < 0
    
    if isNegative {
        x = abs(x)
    }
    
    var reverse = 0
    var lastDigit = 0
    
    while x >= 1 {
        lastDigit = x % 10 // get the last digit
        reverse = reverse * 10 + lastDigit  // shift by order of magnitude each time
        print("x: \(x) lastDigit: \(lastDigit) reverse: \(reverse)")
        x = x / 10         // drop last digit
    }
    return isNegative ? reverse * -1 : reverse
}

reverse(123)    // 321
reverse(-123)   // -321
