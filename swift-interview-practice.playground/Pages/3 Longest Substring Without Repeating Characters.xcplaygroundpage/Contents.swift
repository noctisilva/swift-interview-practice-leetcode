//: https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else { return 0 }
    var maxLength = 1
    var leftIndex = 0
    var rightIndex = 0
    var dict = [Character: Int]()
    for char in s {
        print("char: \(char)")
        if let index = dict[char] {
            print("index: \(index) - rightIndex: \(rightIndex) - leftIndex: \(leftIndex)")
            maxLength = max(maxLength, rightIndex - leftIndex)
            print("maxLength: \(maxLength)")
            leftIndex = max(index, leftIndex)
            print("leftIndex: \(leftIndex)\n")
        }
        rightIndex += 1
        dict[char] = rightIndex
    }
    return max(maxLength, rightIndex - leftIndex)
}
let s = "abcabcbb"
print(lengthOfLongestSubstring(s))

/*
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 */
