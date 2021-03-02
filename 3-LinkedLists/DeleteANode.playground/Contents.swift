import UIKit

/*
 Delete a Node at the Tail of a Linked List
 
 1 -> 2 -> 3 -> NULL.
 
 https://www.hackerrank.com/challenges/delete-a-node-from-a-linked-list/problem
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func printLinkedList(_ head: Node?) -> Void {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}


func deleteNode(_ head: Node, at position: Int) -> Node {
    var currentNode = head
        
    // loop to position
    for _ in 0..<position - 1{
        currentNode = currentNode.next!
    }
        
    // once there delete by skipping ahead x2
    // 1 -> 3
    currentNode.next = currentNode.next!.next
 
    return head
}
// start at the end when defining
let node3 = Node(3)
let node2 = Node(2, node3)
let head = Node(1, node2)

deleteNode(head, at: 1)
printLinkedList(head) // 1 > 3

deleteNode(head, at: 1) // 1
printLinkedList(head)

