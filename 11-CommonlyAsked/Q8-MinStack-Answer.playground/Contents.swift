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

// Doing it with a Linked List
//
// Stacks can be implemented as either arrays or via a linked list.
// If we do it with a linked list, we can store the current minimum value
// with each new node as we pop it onto the list.
//
// That way we have a running record of what the current min was, and the time
// the node was added.
//
// Genious!

class MinStack {
    private class Node {
        var data: Int
        var min: Int // track here
        var next: Node?
        
        init(_ data: Int, _ min: Int, _ next: Node? = nil) {
            self.data = data
            self.min = min
            self.next = next
        }
    }
    
    private var head: Node?
    
    func push(_ data: Int) {
        var currentMin = data
        
        // Check for min with each push
        if head != nil {
            currentMin = Swift.min(data, min()!)
        }
                
        let newNode = Node(data, currentMin)
        newNode.next = head
        head = newNode
    }
    
    func pop() -> Int? {
        let data = head?.data
        head = head?.next
        return data
    }
    
    func min() -> Int? { return head?.min }
}

let stack = MinStack()

stack.push(5)
stack.push(6)
stack.push(3)
stack.push(7)
stack.min()       // 3
stack.pop()
stack.min()       // 3
stack.pop()
stack.min()       // 5


