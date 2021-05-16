import Foundation

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    if intervals.count == 0 { return 0 }
    var numOfOverlap = 0
    var sortedInterval = intervals.sorted(by:{ $0[0] < $1[0]})
    var i = 0
    while i < sortedInterval.count - 1 {
        let curr = sortedInterval[i]
        let next = sortedInterval[i + 1]
        if curr[1] > next[0] {
            if curr[1] > next[1] {
                sortedInterval.remove(at: i)
            } else {
                sortedInterval.remove(at: i+1)
            }
            numOfOverlap += 1
        }else {
            i += 1
        }
    }
    print(sortedInterval)
    return numOfOverlap
}

let testCase = [[1,2],[2,3],[3,4],[1,3]]
print(eraseOverlapIntervals(testCase))
