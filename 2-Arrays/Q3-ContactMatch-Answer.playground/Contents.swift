import Foundation

/*
 When someone searches their contacts based on a phone number, it's nice when a list
 of contact pops up.
 
 Write an algorithm that searches you contacts for phone number strings, and returns:
  - NO CONTACT if contact can't be found
  - A contact if a contact is found
  - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase

 Answer should be correct. Don't worry about performance.
 */
public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    var result = [String]()
    
    // loop through looking for match - when found add to result
    for i in 0..<B.count {
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        return "NO CONTACT"
    } else if result.count == 1 {
        return result.first!
    }
    
    // sort and return first
    return result.sorted().first!
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)   // pom
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT

// edge cases
solution([String](), [String](), "")
solution(A, B, "")

public func solutionDict(_ A : [String], _ B : [String], _ P : String) -> String {

    // Create a dictionary of name / numbers
    var dict = [String: String]()
    
    for i in 0..<A.count {
        dict[A[i]] = B[i]
    }
    
    // look for matches
    let matches = dict.filter { $0.value.contains(P) }
    
    if matches.count == 0 {
        return "NO CONTACT"
    } else if matches.count == 1 {
        return matches.first!.key
    }
    
    // sort by key
    let sortedKeys = matches.keys.sorted()
    
    return sortedKeys.first!
}



