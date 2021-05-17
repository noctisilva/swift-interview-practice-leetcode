//: https://leetcode.com/problems/merge-two-sorted-lists/

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    } else if l2 == nil {
        return l1
    } else if l1!.val < l2!.val {
        l1!.next = mergeTwoLists(l1!.next, l2)
        return l1
    } else {
        l2!.next = mergeTwoLists(l1, l2!.next)
        return l2
    }
}

func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var dummy: ListNode? = ListNode(0)
    let head = dummy
    
    var l1 = l1
    var l2 = l2
    
    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            dummy?.next = l1
            l1 = l1?.next
        } else {
            dummy?.next = l2
            l2 = l2?.next
        }
        dummy = dummy?.next
    }
    
    if l1 != nil {
        dummy?.next = l1
    } else {
        dummy?.next = l2
    }
        
    return head?.next
}
