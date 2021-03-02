import UIKit

/*
 Print the elements of a Linked List
 https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list/problem
 
 This is an to practice traversing a linked list. Given a pointer to the head node of a linked list, print each node's  element, one per line. If the head pointer is null (indicating the list is empty), there is nothing to print.
 
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

// start at the end when defining
let node3 = Node(3)
let node2 = Node(2, node3)
let head = Node(1, node2)

printLinkedList(head)
