import UIKit

/*
 Insert a Node at the Tail of a Linked List
 
 1 -> 2 -> 3 -> NULL.
 
 https://www.hackerrank.com/challenges/insert-a-node-at-the-tail-of-a-linked-list/problem
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


func insertNodeAtTail(_ head: Node, data: Int) -> Node {
    
    // Create new node
    let newNode = Node(data)
    
    // Walk to the end
    var node = head
    while node.next != nil {
        node = node.next!
    }
    
    // Add it
    node.next = newNode
    
    return head
}

// start at the end when defining
let node3 = Node(3)
let node2 = Node(2, node3)
let head = Node(1, node2)

printLinkedList(head)

insertNodeAtTail(head, data: 4)

printLinkedList(head)
