//: https://leetcode.com/problems/remove-nth-node-from-end-of-list/

import Foundation

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var newNode: ListNode? = ListNode(-1)
    var slowNode: ListNode? = newNode
    var fastNode: ListNode? = newNode
    
    newNode?.next = head
    
    for _ in 0..<n {
        fastNode = fastNode?.next
    }
    
    while slowNode?.next != nil && fastNode?.next != nil {
        slowNode = slowNode?.next
        fastNode = fastNode?.next
    }
    
    slowNode?.next = slowNode?.next?.next //because we are removing that nth node
    
    return newNode?.next
}



