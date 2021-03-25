import UIKit

/*
 CheckBST
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 
 Given the root node of a binary tree, determine if it is a binary search tree.
 
 The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
    }
}

// isBST
func isValidBST(root: Node?) -> Bool {
    return _helper(root, nil, nil)
}

private func _helper(_ node: Node?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else {
        return true
    }
    
    // if this nodes data is less than min...
    if let min = min, node.data <= min {
        return false
    }
    // if this nodes data is greater than max...
    if let max = max, node.data >= max {
        return false
    }
    
    // recurse
    return _helper(node.left, min, node.data) && _helper(node.right, node.data, max)
}

var root = Node(4)
root.left = Node(2)
root.right = Node(6)
root.left?.left = Node(1)
root.left?.right = Node(3)
root.right?.left = Node(5)
root.right?.right = Node(7)

isValidBST(root: root)


