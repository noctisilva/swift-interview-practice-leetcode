//: https://leetcode.com/problems/search-in-rotated-sorted-array/

import Foundation

//Binary search
func search(_ nums: [Int], _ target: Int) -> Int {
    //lets create our highs and lows
    var high = nums.count - 1
    var low = 0
    
    //let's do binary search loop. Check if low < high. ultiamtely you are cutting down until you return if the mid is the target. If not, return -1
    while low <= high {
        let mid = low + (high - low) / 2
        print("mid: \(mid) - nums[mid]: \(nums[mid])")
        if nums[mid] == target {
            return mid
        }
        //this means it's not rotated in lower half
        if nums[mid] >= nums[low] {
            //now it's to check if target is in between this and if it is adjust low and high
            if target >= nums[low] && target < nums[mid] {
                high = mid - 1
            } else {
                low = mid + 1 //So this can basically tell us how much it rotated
            }
        //this means it is rotated in lower half
        } else {
            if target <= nums[high] && target > nums[mid] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
    }
    return -1
}

let nums = [4,5,6,7,0,1]
let target = 0

print(search(nums,target))
//O(log n)
