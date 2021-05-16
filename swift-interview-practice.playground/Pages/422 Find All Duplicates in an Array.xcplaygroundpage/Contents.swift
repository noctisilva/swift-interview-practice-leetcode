//: https://leetcode.com/problems/find-all-duplicates-in-an-array/

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// Practice not the leetcode problem
func removeDuplicates(_ str: inout String){
    guard str.count > 0 else { return }
    
    var dict: [Character] = []
    
    for char in str {
        if dict.contains(char) {
            continue
        } else {
            dict.append(char)
        }
    }
    str = String(dict)
    print(str)
}


//removeDucplicates(&str)


//Actual

func findDuplicates(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    
    var dict = [Int: Int]()
    
    for num in nums {
        if dict[num] != nil {
            dict[num]! += 1
        } else {
            dict[num] = 1
        }
    }
    dict = dict.filter{ $0.1 == 2 }
    print(dict)
    return Array(dict.keys)
}
let nums = [4,3,2,7,8,2,3,1]
print(findDuplicates(nums))
