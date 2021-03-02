import Foundation

class Node<T> {
    
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList<T>: CustomStringConvertible where T: Comparable, T: CustomStringConvertible {

    private var startNode: Node<T>?
    
    var isEmpty: Bool {
        return self.startNode == nil
    }
        
    // APPEND NODE FROM LAST
    func append(element: T) {
        let item = Node(data: element)
        if var node = self.startNode {
            while(node.next != nil) {
                node = node.next!
            }
            node.next = item
        } else {
            self.startNode = item
        }
    }
    
    // INSERT NODE AT BEGINNING
    func insert(element: T) {
        let item = Node(data: element)
        item.next = self.startNode
        self.startNode = item
    }
    
    // INSERT NODE AT PARTICULAR POSITION
    func insert(position: Int, element: T) {
        if position == 0 {
            self.insert(element: element)
        } else {
            let item = Node(data: element)
            var nextNode = self.startNode
            var previousNode: Node<T>?
            
            for _ in 0..<position {
                previousNode = nextNode
                nextNode = nextNode?.next
            }
            
            previousNode?.next = item
            item.next = nextNode
        }
    }
    
    // REMOVE NODE FROM BEGINNING
    func removeFirst() {
        self.startNode = self.startNode?.next
    }
    
    // REMOVE NODE FROM END
    func removeLast() {
        var nextNode = self.startNode
        var previousNode: Node<T>?
        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    // REMOVE NODE AT PARTICULAR POSTION
    func remove(at position: Int) {
        if position == 0 {
            self.removeFirst()
        } else {
            var nextNode = self.startNode
            var previousNode: Node<T>?
            for _ in 0..<position {
                previousNode = nextNode
                nextNode = nextNode?.next
            }
            previousNode?.next = nextNode?.next
        }
    }
    
    // SEARCH A PARTICULAR NODE
    func search(element: T) -> Int {
        var node = self.startNode
        var count = 0
        while(node != nil) {
            if node?.data == element {
                return count
            }
            count += 1
            node = node?.next
        }
        return count
    }
    
    var description: String {
        var data = ""
        let top = "### LINK LIST ###\n"
        let bottom = "\n#############\n"
        var node = self.startNode
        while(node != nil) {
            data += (node?.data.description)! + "\n"
            node = node?.next
        }
        return top + data + bottom
    }
}

let linkList = LinkList<Int>()
linkList.append(element: 0)
linkList.append(element: 1)
linkList.append(element: 2)
linkList.append(element: 3)
linkList.append(element: 4)
linkList.append(element: 5)
print(linkList.description)
linkList.insert(element: 100)
print(linkList.description)
linkList.insert(position: 4, element: 1000)
print(linkList.description)
print(linkList.search(element: 2))
print(linkList.description)
linkList.removeFirst()
print(linkList.description)
linkList.removeLast()
print(linkList.description)
linkList.remove(at: 2)
print(linkList.description)
