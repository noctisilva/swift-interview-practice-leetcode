//: https://leetcode.com/problems/container-with-most-water/

import Foundation

func maxArea(_ height: [Int]) -> Int {
    return 0
}

func maxArea1(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea = 0
    while left < right {
        print("left: \(left) | right: \(right)")
        print("height[left]: \(height[left]) | height[right]: \(height[right]) | ")
        maxArea = max(maxArea,min(height[left],height[right]) * (right - left))
        print("maxArea: \(maxArea)\n")
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return maxArea
}

let height = [1,8,6,2,5,4,8,3,7]
//let height = [8,8,6,2,5,4,8,3,1]

print(maxArea1(height))
