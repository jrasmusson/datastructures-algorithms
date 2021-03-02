import UIKit

/*
 Insert a Node at the Head of a Linked List
 
 1 -> 2 -> 3 -> NULL.
 
 https://www.hackerrank.com/challenges/insert-a-node-at-the-head-of-a-linked-list/problem
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

func insertNodeAtHead(_ head: inout Node, data: Int) -> Node {
    // Create new node - make it the Head and set it's next to the current Head
    let newHead = Node(data, head)
    head = newHead
    return newHead
}

// start at the end when defining
let node3 = Node(3)
let node2 = Node(2, node3)
var head = Node(1, node2)

insertNodeAtHead(&head, data: 4)

printLinkedList(head)
