//: [Previous](@previous)

import Foundation


// O(1) in place
func reverseString(_ s: inout String) {
    var s = Array(s)
    var left = 0
    var right = s.count - 1
    
    while left < right {
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        left += 1
        right -= 1
    }
    print(s)
}


// O(1)
func reverseString1(_ s: inout [Character]) {
    s = s.reversed()
    print(s)
}

var str = "I have no idea what is going on mate"

reverseString(&str)
