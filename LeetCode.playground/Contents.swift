/*
 1. Two Sum
*/
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var foundPairs = [Int]()
    
    for x in 0..<nums.count {
        for i in (x+1)..<nums.count {
            let total = nums[x] + nums[i]

            if total == target {
                foundPairs = [x, i]
                break
            }
        }
    }
    
    return foundPairs
}

let nums = [3,2,4]
let target = 6

twoSum(nums, target)
