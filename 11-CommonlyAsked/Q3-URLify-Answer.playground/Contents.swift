import UIKit

/*
 _   _ ___ _    _  __
| | | | _ \ |  (_)/ _|_  _
| |_| |   / |__| |  _| || |
 \___/|_|_\____|_|_|  \_, |
                      |__/

  Challenge: See if you can replaces all the spaces in a a string with the
  ASCII symbol for space '%20'. Assume you are given the length of the final
  string. Hint: Use array of char[].

 */

func urlify(_ url: String, length: Int) -> String {
    // Create a bucket to hold our final result
    var result = Array<Character>(repeating: " ", count: length)

    // Strip off any space at beginning or end
    let url = url.trimmingCharacters(in: .whitespacesAndNewlines)

    // Loop through url, and insert an ASCII space '%20' whenever we hit a space
    let urlChars = Array(url)

    // Also create a pointer to keep track of where we are in our results array
    var pointer = 0

    for i in 0..<urlChars.count {
        if urlChars[i] != " " {
            result[pointer] = urlChars[i]
            pointer += 1
        } else {
            result[pointer] = "%"
            result[pointer+1] = "2"
            result[pointer+2] = "0"
            pointer = pointer + 3
        }
    }

    return String(result)
}

urlify("My Home Page    ", length: 16) // "My%20Home%20Page"

