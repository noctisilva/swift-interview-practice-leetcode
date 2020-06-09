//: https://leetcode.com/problems/two-sum-iv-input-is-a-bst/

import Foundation

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    
    guard root != nil else { return false }
    var dict = [Int]()
    var queue = [TreeNode]()
    queue.append(root!)
    while !queue.isEmpty {
        let count = queue.count

        for i in 0..<count {
            let node = queue.removeFirst()
            let diff = k - node.val
            if dict.contains(diff) {
                return true
            }
            dict.append(node.val)
            
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }
        
    }
    return false
}
