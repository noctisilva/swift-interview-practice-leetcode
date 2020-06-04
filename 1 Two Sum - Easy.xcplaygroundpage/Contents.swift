//: https://leetcode.com/problems/two-sum/

import Foundation

func twoSum(_ nums: [Int],_ target: Int) -> [Int] {
    guard !nums.isEmpty else { return [] }
    var dict = [Int:Int]()
    var res = [Int]()
    
    for (index,value) in nums.enumerated() {
        if let i = dict[target - value] {
            res.append(i)
            res.append(index)
            break;
        }
        
        dict[value] = index
    }
    return res
}
let nums = [2,7,11,15]
let target = 9
print(twoSum(nums,target))

/*
 TC: O(N)
 SP: O(N)
 */
