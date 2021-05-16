//: https://leetcode.com/problems/merge-k-sorted-lists/

import Foundation

//Approach 1 turn the listnode into array, sort then turn it back into listnode
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var listArray = [Int]()
    var result: ListNode = ListNode(-1)
    var head = result
    for node in lists {
        while node?.next != nil {
            listArray.append(node!.val)
        }
    }
    
    for val in listArray {
        result.next?.val = val
    }
    
    return head.next
}

//aproach 2, use HEAP
