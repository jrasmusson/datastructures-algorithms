import UIKit

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

/*
 Insight: Connect the head of one list to the tail of the other and iterate
          until the same.
 */
func findMerge(headA: Node, headB: Node) -> Int {
    var currentA = headA
    var currentB = headB
    
    // Do until the two nodes are the same
    while (currentA.data != currentB.data) {
        // if you reach the end of A, restart at head of B
        if currentA.next == nil {
            currentA = headB
        } else {
            currentA = currentA.next!
        }
        // end of b restart at beginning of A
        if currentB.next == nil {
            currentB = headA
        } else {
            currentB = currentB.next!
        }
    }
    
    return currentB.data
}

// 1 2 3
let node3 = Node(3)
let node2 = Node(2, node3)
let headA = Node(1, node2)

// 4 2 6
let node6 = Node(6)
let node22 = Node(2, node6)
let headB = Node(4, node22)

findMerge(headA: headA, headB: headB)
