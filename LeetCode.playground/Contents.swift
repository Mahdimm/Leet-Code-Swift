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

/*
 2. Add Two Numbers
*/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

    
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var node1 = l1
    var node2 = l2
    
    var main: ListNode?
    var temp: ListNode?
    var counter = 0
    
    while node1 != nil || node2 != nil {
        let firstValue  = node1?.val ?? 0
        let secondValue = node2?.val ?? 0
        
        let sum = firstValue + secondValue + counter
        counter = sum / 10
        
        if temp == nil {
            temp = ListNode(sum % 10)
            main = temp
        } else {
            temp?.next = ListNode(sum % 10)
            temp = temp?.next
        }
        
        node1 = node1?.next
        node2 = node2?.next
    }
    
    if counter > 0 {
        temp?.next = ListNode(counter)
    }
    
    return main
}
    

var firstNode1 = ListNode(2)
var firstNode2 = ListNode(4)
var firstNode3 = ListNode(3)
var firstNode4 = ListNode(5)
var firstNode5 = ListNode(2)

var secondNode1 = ListNode(5)
var secondNode2 = ListNode(6)
var secondNode3 = ListNode(4)
var secondNode4 = ListNode(5)
var secondNode5 = ListNode(2)

firstNode1.next = firstNode2
firstNode2.next = firstNode3
firstNode3.next = firstNode4
firstNode4.next = firstNode5

secondNode1.next = secondNode2
secondNode2.next = secondNode3
secondNode3.next = secondNode4
secondNode4.next = secondNode5

let test = addTwoNumbers(firstNode1, secondNode1)

/*
 3. Longest Substring Without Repeating Characters
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 1 else {
        return s.count
    }

    var length = 0
    var substring = [Character]()

    for char in s {
        if substring.contains(char), let index = substring.firstIndex(of:char) {
            length = max(length, substring.count)
            substring.removeSubrange(0...index)
        }
        substring.append(char)
    }

    return max(length, substring.count)
}

//lengthOfLongestSubstring("abcabcbb")
//lengthOfLongestSubstring("bbbbb")
//lengthOfLongestSubstring("pwwkew")
lengthOfLongestSubstring("au")
lengthOfLongestSubstring("  ")
lengthOfLongestSubstring("aab")

/*
 4. Median of Two Sorted Arrays
*/

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var nums3 = nums1 + nums2
    nums3 = nums3.sorted()
    
    
    if nums3.count % 2 == 0 {
        let middle = (nums3.count / 2) - 1
        return Double(Double(nums3[middle] + nums3[middle + 1]) / 2.0)
    } else {
        let middle = nums3.count / 2
        return Double(nums3[middle])
    }
}

//let first = [-5, 3, 6, 12, 15]
//let second = [-12, -10, -6, -3, 4, 10]
///
//let first = [2, 3, 5, 8]
//let second = [10, 12, 14, 16, 18, 20]
///
//let first = [1,3]
//let second = [2]
///
let first = [1,2]
let second = [3,4]

let final = findMedianSortedArrays(first, second)
