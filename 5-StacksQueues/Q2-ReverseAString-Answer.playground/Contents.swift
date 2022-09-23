import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reverses the String
 using a stack.
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
