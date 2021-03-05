import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
    
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }
        
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }

        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        node.next = newNode
    }
    
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
            
        let newNode = Node(data)
        var currentNode = head

        for _ in 0..<position - 1{
            currentNode = currentNode?.next!
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        self.head = self.head?.next
    }
    
    func deleteLast() {
        var nextNode = head
        var previousNode: Node?
        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }

    func delete(data: Int) {
        // if head
        if head == nil { return }
        if head!.data == data {
            head = head?.next
        }
        
        // else walk the list
        let current = head
        while current?.next != nil {
            if current?.next?.data == data {
                current?.next = current?.next?.next
                return
            }
        }
    }

    func printLinkedList() {
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

    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
    }
}

let linkList = LinkList()
linkList.addBack(1)
linkList.addBack(2)
linkList.addBack(3)
linkList.printLinkedList()
linkList.addFront(4)
linkList.printLinkedList()
linkList.insert(position: 2, data: 5)
linkList.printLinkedList()
