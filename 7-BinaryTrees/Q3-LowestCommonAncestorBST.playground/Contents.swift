import UIKit

/*
 Lowest common ancestor (LCA) in BST.
 https://www.geeksforgeeks.org/lowest-common-ancestor-in-a-binary-search-tree/
 
 O(h) - height of the tree
 
 1. If the value of the current node is less than both n1 and n2, then LCA lies in the right.
 2. If the value of the current node is greater than both n1 and n2, then LCA lies in the left.
 3. If both the above cases are false then return the current node as LCA.
 
                    20
                  /    \
                8        22
              /   \
            4       12
                  /    \
                10      14
 */
class Node {
    var data: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.data = key
    }
}

class BinaryTree {
    var root: Node?
    
    func lca(_ node: Node?, _ n1: Int, _ n2: Int) -> Node? {
        if node == nil { return nil }
        
        // If both n1 and n2 are smaller than root, then LCA lies in left
        if node!.data > n1 && node!.data > n2 {
            return lca(node?.left, n1, n2)
        }
        
        // If both n1 and n2 are larger than root, then LCA lies in right
        if node!.data < n1 && node!.data < n2 {
            return lca(node?.right, n1, n2)
        }
        
        // Else we are at the node which is the LCA
        return node
    }
}

let tree = BinaryTree()
tree.root = Node(20)
tree.root?.left = Node(8)
tree.root?.right = Node(22)
tree.root?.left?.left = Node(4)
tree.root?.left?.right = Node(12)
tree.root?.left?.right?.left = Node(10)
tree.root?.left?.right?.right = Node(14)

var n1 = 10, n2 = 14
var t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))") // 12

n1 = 14; n2 = 8
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))") // 8

n1 = 10; n2 = 22
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))") // 20
