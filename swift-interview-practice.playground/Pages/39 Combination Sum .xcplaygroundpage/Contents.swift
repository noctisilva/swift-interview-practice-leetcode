//: https://leetcode.com/problems/combination-sum/

import Foundation

/*
 you can do this with backtracking / dfs

 From https://stackoverflow.com/a/60824947/2975273  :
 
 Backtracking is just depth first search with specific termination conditions.

 Consider walking through a maze where for each step you make a decision, that decision is a call to the call stack (which conducts your depth first search)... if you reach the end, you can return your path. However, if you reach a deadend, you want to return out of a certain decision, in essence returning out of a function on your call stack.

 So when I think of backtracking I care about

 State
 Decisions
 Base Cases (Termination Conditions)
 I explain it in my video on backtracking here: https://www.youtube.com/watch?v=P68upMd_QxE&t=120s

 An analysis of backtracking code is below. In this backtracking code I want all of the combinations that will result in a certain sum or target. Therefore, I have 3 decisions which make calls to my call stack, at each decision I either can pick a number as part of my path to reach the target num, skip that number, or pick it and pick it again. And then if I reach a termination condition, my backtracking step is just to return. Returning is the backtracking step because it gets out of that call on the call stack.
 
 Example:
 
 class Solution:

 """

 Approach: Backtracking

 State
     -candidates
     -index
     -target

 Decisions
     -pick one --> call func changing state: index + 1, target - candidates[index], path + [candidates[index]]
     -pick one again --> call func changing state: index, target - candidates[index], path + [candidates[index]]
     -skip one --> call func changing state: index + 1, target, path

 Base Cases (Termination Conditions)
     -if target == 0 and path not in ret
         append path to ret
     -if target < 0:
         return # backtrack

 """

 def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
     """
     @desc find all unique combos summing to target
     @args
         @arg1 candidates, list of ints
         @arg2 target, an int
     @ret ret, list of lists
     """
     if not candidates or min(candidates) > target: return []

     ret = []
     self.dfs(candidates, 0, target, [], ret)
     return ret

 def dfs(self, nums, index, target, path, ret):
     if target == 0 and path not in ret:
         ret.append(path)
         return #backtracking
     elif target < 0 or index >= len(nums):
         return #backtracking


     # for i in range(index, len(nums)):
     #     self.dfs(nums, i, target-nums[i], path+[nums[i]], ret)

     pick_one = self.dfs(nums, index + 1, target - nums[index], path + [nums[index]], ret)
     pick_one_again = self.dfs(nums, index, target - nums[index], path + [nums[index]], ret)
     skip_one = self.dfs(nums, index + 1, target, path, ret)
 
 */

//THE POWER OF DPS LMAO FML I'M GOING NUTS I HATE THIS SHIT
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var item:[Int] = []
    var res:[[Int]] = []
    dps(candidates, index:0, target: target, current: 0, item: &item, res: &res)
    return res
}

func dps(_ nums: [Int], index:Int, target: Int, current: Int, item: inout [Int], res: inout [[Int]]){
    if target == current {
        res.append(item)
        return
    }else if current > target{
        return
    }
    for i in index..<nums.count{
        item.append(nums[i])
        dps(nums, index:i, target: target, current: current + nums[i], item: &item, res: &res)
        item.removeLast()
    }
}
