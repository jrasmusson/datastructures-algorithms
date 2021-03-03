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
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
        
    func addBack(_ data: Int) {
        let newNode = Node(data)
        if var node = head {
            while(node.next != nil) {
                node = node.next!
            }
            node.next = newNode
        } else {
            head = newNode
        }
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
    
    func removeFirst() {
        self.head = self.head?.next
    }
    
    func removeLast() {
        var nextNode = head
        var previousNode: Node?
        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func remove(at position: Int) {
        if position == 0 {
            self.removeFirst()
        } else {
            var nextNode = self.head
            var previousNode: Node?
            for _ in 0..<position {
                previousNode = nextNode
                nextNode = nextNode?.next
            }
            previousNode?.next = nextNode?.next
        }
    }
    
    func search(data: Int) -> Int {
        var node = self.head
        var count = 0
        while(node != nil) {
            if node?.data == data {
                return count
            }
            count += 1
            node = node?.next
        }
        return count
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
