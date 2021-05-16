//: https://leetcode.com/problems/longest-palindromic-substring/

import Foundation

func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else { return s }
    var longestPalindrome = ""
    return longestPalindrome
}

func longestPalindrome1(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        let s = Array(s)
        var isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var left = 0
        var right = 0
        for j in 1..<s.count {
            for i in 0..<j {
                // Rules
                // 1. If s[i] == s[j] and the length of the word is 2 or less then its a palindrome
                // 2. If s[i] == s[j] and the inner word is a palindrome then s[i...j] is a palindrome
                print("i: =\(i) | j: =\(j) | isPalindrome[i + 1][j - 1]: \(isPalindrome[i + 1][j - 1])")
                if s[i] == s[j] && (isPalindrome[i + 1][j - 1] || j - i <= 2) {
                    isPalindrome[i][j] = true
                    print("isPalindrome[i][j]: \(isPalindrome[i][j])")
                    if j - i > right - left {
                        left = i
                        right = j
                        print("left: \(left) | right: \(right)")
                    }
                }
            }
        }
        return String(s[left...right])
}

let s = "babad"
print(longestPalindrome1(s))
