import UIKit

/*
 _    _      _          _   _    _    _
| |  (_)_ _ | |_____ __| | | |  (_)__| |_ ___
| |__| | ' \| / / -_) _` | | |__| (_-<  _(_-<
|____|_|_||_|_\_\___\__,_| |____|_/__/\__/__/
 
 */

// A linked list is simply a node with a pointer to next
class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

// You can chain them together like this
let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// We can print them out by walking the list
func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}
printLinkedListSimple(node1)

// Here we collect the result and print from an array
func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

printLinkedList(node1)

func addFront(_ head: inout Node, data: Int)  {
    let newNode = Node(data)
    newNode.next = head
    head = newNode
}

var head = node1
addFront(&head, data: 4)
printLinkedList(head)

func getFirst(_ head: Node) -> Int {
    return head.data
}
getFirst(head)

func getLast(_ head: Node) -> Int {
    // walk to the end
    var node = head
    while node.next != nil {
        node = node.next!
    }
    // return the data
    return node.data
}
getLast(head)

func addBack(_ head: Node, data: Int) -> Node {
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

addBack(head, data: 5)
printLinkedList(head)

func deleteFirst(_ head: inout Node) {
    head = head.next!
}
deleteFirst(&head)
printLinkedList(head)

func deleteLast(_ head: inout Node) {
    var nextNode = head
    var previousNode: Node?
    while(nextNode.next != nil) {
        previousNode = nextNode
        nextNode = nextNode.next!
    }
    previousNode?.next = nil
}
deleteLast(&head)
printLinkedList(head)

func insert(head: Node, data: Int, position: Int) -> Node {
    let newNode = Node(data)
    var currentNode = head
    
    // loop to position
    for _ in 0..<position - 1{
        currentNode = currentNode.next!
    }
        
    // once there insert yourself
    // grab the current next, and make it yournext
    newNode.next = currentNode.next
    
    // then take the current node, and make yourself it's next
    currentNode.next = newNode
 
    return head
}

head = insert(head: head, data: 6, position: 2)
printLinkedList(head)
