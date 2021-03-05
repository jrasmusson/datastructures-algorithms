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
    }
        
    func addBack(_ data: Int) {
    }
    
    func insert(position: Int, data: Int) {
    }
    
    func deleteFirst() {
    }
    
    func deleteLast() {
    }
    
    func delete(data: Int) {
    }

    func printLinkedList() {
    }
    
    var isEmpty: Bool {
        return false
    }
    
    func clear() {
    }
}
