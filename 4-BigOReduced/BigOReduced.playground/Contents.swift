import UIKit

/*
 ___ _       ___    ___        _                _
| _ |_)__ _ / _ \  | _ \___ __| |_  _ __ ___ __| |
| _ \ / _` | (_) | |   / -_) _` | || / _/ -_) _` |
|___/_\__, |\___/  |_|_\___\__,_|\_,_\__\___\__,_|
      |___/

 */

func someFunc(_ n: Int) {
    var a = 0
    a = 5
    a += 1
    
    for _ in 0..<n { 
        // simple statements
    }
    
    for _ in 0..<n {
        // simple statements
        for _ in 0..<n {
            // simple statements
        }
    }
}

func dropConstants(_ n: Int) {
    for _ in 0..<n { // O(n)
        // simple statements
    }

    for _ in 0..<n { // O(n)
        // simple statements
    }

    for _ in 0..<n { // O(n)
        // simple statements
    }
}

func addDominant(_ n: Int, _ m: Int) {
    for _ in 0..<n { // O(n)
        // simple statements
    }

    for _ in 0..<m { // O(m)
        // simple statements
    }
}

func nested(_ n: Int, _ m: Int) {
    for _ in 0..<n { // O(n)
        // simple statements
        for _ in 0..<m { // O(m)
            // simple statements
        }
    }
}













func someConditional(_ n: Int) {
    if n == 2 {
        for _ in 0..<n {
            // simple statements
        }
    } else {
        for _ in 0..<n {
            // simple statements
            for _ in 0..<n {
                // simple statements
            }
        }
    }
}












/*
   _                  _
  /_\  _ _ __ __ _ __| |___
 / _ \| '_/ _/ _` / _` / -_)
/_/ \_\_| \__\__,_\__,_\___|
 
 */

func foo(_ n: Int) {
    for _ in 0..<n {
        // ...
    }
    for _ in 0..<n {
        // ...
    }
}

func bar(_ n: Int, _ m: Int) {
    for _ in 0..<n {
        // ...
        for _ in 0..<m {
            // ...
        }
    }
}

func baz(_ array: [Int]) {
    for i in 0..<array.count {
        // ...
        for j in 0..<array.count {
            // ...
            if array[i] == array[j] {
                // Launch!
            }
        }
    }
}

func bep(_ array: [Int]) {
    for _ in 0..<array.count {
        // ...
        for _ in 0..<array.count {
            // ...
            for _ in 0..<999999999 {
                // Jump!
            }
        }
    }
}






// foo > O(2n) > O(n)
// bar > O(n*m)
// baz > O(n^2)
// bep > O(n^2)
