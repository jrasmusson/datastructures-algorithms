import UIKit

/*
 __  __ _           _           _
|  \/  (_)_ _    __| |_ __ _ __| |__
| |\/| | | ' \  (_-<  _/ _` / _| / /
|_|  |_|_|_||_| /__/\__\__,_\__|_\_\

 // Challenge: Design a stack which, in addition to push and pop, has a function
 // 'min' which returns the minimum element? Push, pop and min should all operate in
 // O(1) time.

 */

let stack = MinStack() // Create this how ever you want...

stack.push(5)
stack.push(6)
stack.push(3)
stack.push(7)
stack.min()       // 3
stack.pop()
stack.min()       // 3
stack.pop()
stack.min()       // 5


