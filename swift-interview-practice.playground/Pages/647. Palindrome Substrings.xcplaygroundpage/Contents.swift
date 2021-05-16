//: [Previous](@previous)

import Foundation

var str = "racecar"

var count = 0

func countSubstrings(_ s: String) -> Int {
    guard s.count > 1 else { return s.count }
    let chars = Array(s)
    for i in 0..<chars.count {
        isPalindrome(chars, i, i)
        isPalindrome(chars, i, i+1)
    }
    return count
}

func isPalindrome(_ chars: [Character], _ l: Int, _ r: Int) {
    var l = l
    var r = r
    while l >= 0, r < chars.count, chars[l] == chars[r] {
        count += 1
        l -= 1
        r += 1
    }
    return
}
print(countSubstrings(str))
