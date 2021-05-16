//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil { return false }
    return isEqual(s, t) || isSubtree(s?.left, t) || isSubtree(s?.right, t)
}

func isEqual(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil && t == nil { return true }
    guard let s = s, let t = t, s.val == t.val else { return false }
    return isEqual(s.left, t.left) && isEqual(s.right, t.right)
}
let s = [3,4,5,1,2]
let t = [4,1,2]

let s1 = BinaryTreeHelper.buildTree(withNodes: s)
let t1 = BinaryTreeHelper.buildTree(withNodes: s)

print(isSubtree(s1, t1))
