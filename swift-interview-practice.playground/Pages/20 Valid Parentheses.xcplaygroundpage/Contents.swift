//: https://leetcode.com/problems/valid-parentheses/

import Foundation

func isValid(_ s: String) -> Bool {
    guard s.count > 2 else { return false }
    var stack = [Character]()
    
    for char in s {
        if char == "(" {
            stack.append(")")
        } else if char == "{" {
            stack.append("}")
        } else if char == "[" {
            stack.append("]")
        } else {
            if stack.isEmpty || stack.last != char {
                return false
            }
            stack.removeLast()
        }
    }
    return stack.isEmpty
}
