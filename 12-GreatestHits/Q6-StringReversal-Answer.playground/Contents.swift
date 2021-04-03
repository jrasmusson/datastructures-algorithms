import UIKit

/*
 ___ _       _             ___                          _
/ __| |_ _ _(_)_ _  __ _  | _ \_____ _____ _ _ ___ __ _| |
\__ \  _| '_| | ' \/ _` | |   / -_) V / -_) '_(_-</ _` | |
|___/\__|_| |_|_||_\__, | |_|_\___|\_/\___|_| /__/\__,_|_|
                   |___/
 
 // Challenge: Given a string, return it's reverse.
 // "abc" => "cba"

 */

func reverse(_ text: String) -> String {
    var chars = Array(text)

    // Initialize pointers
    var left = 0
    var right = text.count - 1;

    // Loop through swapping left and right until we hit the middle
    for _ in 0..<text.count / 2 {
        let temp = chars[left]
        chars[left] = chars[right]
        chars[right] = temp
        left += 1
        right -= 1
    }

    return String(chars)
}

reverse("Hello")    // olleH
reverse("Sam")      // maS
reverse("It's been a long time.") // .emit gnol a neeb s'tI

String("Hello".reversed())
