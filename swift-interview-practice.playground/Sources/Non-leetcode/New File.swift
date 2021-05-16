import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



public protocol BinaryTreeNodePrintable {
    func leftSubTree() -> BinaryTreeNodePrintable?
    func rightSubTree() -> BinaryTreeNodePrintable?
    func presentation() -> String
}

public class BinaryTreeHelper {
    public static func buildTree(withNodes nodes: [Int?]) -> TreeNode? {
        let root = buildTree(withNodes: nodes, index: nodes.startIndex)
        return root
    }
    
    public static func buildTree(withNodes nodes: [Int?], index: Int) -> TreeNode? {
        if index < nodes.endIndex {
            if let nodeValue = nodes[index] {
                let node = TreeNode(nodeValue)
                node.left = buildTree(withNodes: nodes, index: index * 2 + 1)
                node.right = buildTree(withNodes: nodes, index: index * 2 + 2)
                return node
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

extension BinaryTreeHelper {
    
    fileprivate static let indentStrVertical    = " │      "
    fileprivate static let indentStrBlank       = "        "
    fileprivate static let indentStrLine        = "───── "
    fileprivate static let indentStrRightChild  = " ┌"
    fileprivate static let indentStrLeftChild   = " └"
    
    public static func getStructureDescription(forNode node: BinaryTreeNodePrintable?) -> String {
        var description = "\n"
        if let root = node {
            if let rc = root.rightSubTree() {
                description += getSubtreeStructureDescription(rc, isRightSubtree: true, indent: "")
            }
            
            description += root.presentation() + "\n"
            
            if let lc = root.leftSubTree() {
               description += getSubtreeStructureDescription(lc, isRightSubtree: false, indent: "")
            }
        } else {
            description = "nil"
        }
        return description
    }
    
    public static func getSubtreeStructureDescription(_ subtree: BinaryTreeNodePrintable, isRightSubtree: Bool, indent: String) -> String {
        
        var description = ""
        
        let leftSubtreeIndent = indent + (isRightSubtree ? indentStrVertical : indentStrBlank)
        let rightSubTreeIndent = indent + (isRightSubtree ? indentStrBlank : indentStrVertical)
        let fullIndent = indent + (isRightSubtree ? indentStrRightChild : indentStrLeftChild) + indentStrLine
        
        if let rc = subtree.rightSubTree() {
            description += getSubtreeStructureDescription(rc, isRightSubtree: true, indent: rightSubTreeIndent)
        }
        
        description += fullIndent + subtree.presentation() + "\n"
        
        if let lc = subtree.leftSubTree() {
            description += getSubtreeStructureDescription(lc, isRightSubtree: false, indent: leftSubtreeIndent)
        }
        return description
    }
    
}
