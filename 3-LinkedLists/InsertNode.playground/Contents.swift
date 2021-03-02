import UIKit

/*
 Insert a node at a specific position in a linked list
 // https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem
 
 Given the pointer to the head node of a linked list and an integer to insert at a certain position, create a new node with the given integer as its attribute, insert this node at the desired position and return the head node.

 A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The head pointer given may be null meaning that the initial list is empty.
 
 Example
 
 head refers to the first node in the list 1 -> 2 -> 3
 data = 4
 position = 2

Insert a node at position 2 with data = 4. The new list is 1 -> 2 -> 4 -> 3
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func insertNodeAtPosition(head: Node?, data: Int, position: Int) -> Node? {
    let newNode = Node(data)
    
    if head == nil {
        return newNode
    }
    
    var currentNode = head
    
    // loop to position
    for _ in 0..<position - 1{
        currentNode = currentNode?.next
    }
        
    // once there insert yourself
    // grab the current next, and make it yournext
    // 4 -> 3
    newNode.next = currentNode?.next
    
    // then take the current node, and make yourself it's next
    // 2 -> 4
    currentNode?.next = newNode
 
    return head
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

var head = insertNodeAtPosition(head: node1, data: 4, position: 2)

print(head?.data)
print(head?.next?.data)
print(head?.next?.next?.data)
print(head?.next?.next?.next?.data)

