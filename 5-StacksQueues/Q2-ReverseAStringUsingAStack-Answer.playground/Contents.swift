import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

/*
The followings are the steps to reversing a String using Stack:
String to char[].
Create a Stack.
Push all characters, one-by-one.
Then Pop all characters, one by one and put into the char[].
Finally, convert to the String.
*/

func solution(_ text: String) -> String {
    var chars = Array(text)
    
    // Create stack
    var result = [String]()
    
    // Push chars
    for c in chars {
        result.append(String(c))
    }
    
    // Pop chars
    for i in 0..<result.count {
        chars[i] = Character(result.popLast()!)
    }
    
    return String(chars)
}

solution("abc") // bca
solution("Would you like to play a game?")
