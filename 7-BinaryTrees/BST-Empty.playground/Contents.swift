import UIKit

class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
    
    var min: Node {
        if left == nil {
            return self
        } else {
            return left!.min
        }
    }
}

class BST {
    var root: Node?

    func insert(key: Int) {
    }

    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        return Node(key)
    }

    func find(key: Int) -> Int? {
        return nil
    }

    private func find(_ node: Node?, _ key: Int) -> Node? {
        return nil
    }
    
    func findMin() -> Int {
        guard let root = root else { return 0 }
        return findMin(root).key;
    }

    private func findMin(_ node: Node) -> Node {
        return node.min;
    }

    func delete(key: Int) {
    }
    
    private func delete(_  node: inout Node?, _ key: Int) -> Node? {
        return nil
    }

    func prettyPrint() {
        // Hard code print for tree depth = 3
        let rootLeftKey = root?.left == nil ? 0 : root?.left?.key
        let rootRightKey = root?.right == nil ? 0 : root?.right?.key
        
        var rootLeftLeftKey = 0
        var rootLeftRightKey = 0
        
        if root?.left != nil {
            rootLeftLeftKey = root?.left?.left == nil ? 0 : root?.left?.left?.key as! Int
            rootLeftRightKey = root?.left?.right == nil ? 0 : root?.left?.right?.key as! Int
        }
        
        var rootRightLeftKey = 0
        var rootRightRightKey = 0
        
        if root?.right != nil {
            rootRightLeftKey = root?.right?.left == nil ? 0 : root?.right?.left?.key as! Int
            rootRightRightKey = root?.right?.right == nil ? 0 : root?.right?.right?.key as! Int
        }
     
        let str = """
                       \(root!.key)
                    /    \\
                   \(rootLeftKey!)      \(rootRightKey!)
                  / \\    /  \\
                 \(rootLeftLeftKey)   \(rootLeftRightKey)  \(rootRightLeftKey)    \(rootRightRightKey)
        """
        
        print(str)
    }
}

let bst = BST()
bst.insert(key: 5)
bst.insert(key: 3)
bst.insert(key: 2)
bst.insert(key: 4)
bst.insert(key: 7)
bst.insert(key: 6)
bst.insert(key: 8)

//bst.prettyPrint()

