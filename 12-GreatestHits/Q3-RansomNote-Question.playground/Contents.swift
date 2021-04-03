import UIKit

/*
 ___                               _  _     _       _
| _ \__ _ _ _  ___ ___ _ __  ___  | \| |___| |_ ___| |
|   / _` | ' \(_-</ _ \ '  \/ -_) | .` / _ \  _/ -_)_|
|_|_\__,_|_||_/__/\___/_|_|_\___| |_|\_\___/\__\___(_)

 // Challenge: Write a ransom note by cutting letters out of the available
 // magazines and pasting them together to form a letter. Given an arbitrary
 // ransom note string and another string containing all the contents of all
 // the magazines, write a function that will return true if the ransom
 // note can be made from the magazines; otherwise, it will return false.
 // Every letter found in the magazine string can only be used once in your
 // ransom note.

 // Assumption: We don't need to count spaces in our note
 */

func canWrite(note: String, letters: String) -> Bool {
    return false
}

canWrite(note: "Pay", letters: "yaP")
canWrite(note: "Pay", letters: "yaP a")
canWrite(note: "Pay me $1000", letters: "ayPem0001$")
canWrite(note: "Pay", letters: "Pa")
