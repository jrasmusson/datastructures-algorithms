import UIKit

/*
   _
  /_\  _ _ _ _ __ _ _  _ ___
 / _ \| '_| '_/ _` | || (_-<
/_/ \_\_| |_| \__,_|\_, /__/
                    |__/
 */

struct Person {}

let ints = [1, 2, 3]
let strings = ["a", "b", "c"]
let people = [Person(), Person(), Person()]

//let ints = [Int]()
//let strings = [String]()
//let people = [Person]()

let arrayOfSpecificSize = Array<Int>(repeating: 1, count: 10)

var array = ["a", "b", "c", "d"]
array.remove(at: 1)
array.insert("b", at: 1)
array.append("e")

