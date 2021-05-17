//: https://leetcode.com/problems/merge-k-sorted-lists/

import Foundation

//Approach 1 turn the listnode into array, sort then turn it back into listnode
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var listArray = [Int]()
    var result: ListNode = ListNode(-1)
    var head = result
    for node in lists {
        var node: ListNode? = node
        while node != nil {
            listArray.append(node!.val)
            node = node?.next
        }
    }
    
    listArray.sort(by: { $0 < $1 })
    
    for val in listArray {
        var newNode = ListNode(val)
        result.next = newNode
        // print(newNode.val)
        result = result.next!// || result = newNode <- both of these set the current result to the next node for next iteration in the for loop. don't be stupid.
        // print("curr: \(newNode.val)")
    }
    
    return head.next
}

//aproach 2, it can ALSO be used for heap for min but...idk that's too much for this IMO

var listArray1 = [1,4,5]
var listArray2 = [1,3,4]
var listArray3 = [2,6]
//
func createNode(_ list: [Int]) -> ListNode {
    guard list.count > 0 else { return ListNode() }
    var result: ListNode? = ListNode(-1)
    let node = result
    for val in list {
        let newNode = ListNode(val)
        result?.next = newNode
        result = newNode
    }
    return node?.next ?? ListNode()
}

let node1 = createNode(listArray1)
let node2 = createNode(listArray2)
let node3 = createNode(listArray3)
let nodeArray: [ListNode] = [node1,node2,node3]

print(mergeKLists(nodeArray))
