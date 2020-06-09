//: https://app.codesignal.com/interview-practice/task/rMe9ypPJkXgk3MHhZ/description

//CodeSignal

import Foundation

func possibleSums(_ coins: [Int],_ quantity: [Int]) -> Int {
    var resultSet = Set<Int>()
    var tempSet = Set<Int>()
    resultSet.insert(0) //to start the array. Will subtract this later when outputting
    for i in 0..<coins.count {
        let coin = coins[i]
        for q in 0..<quantity[i] {
            let val = (q + 1) * coin
            for currentSumInIndex in resultSet { // we do this because we're trying to use all of the coins not just one
                print("coin: \(coin) | q: \(q) | val: \(val) | s: \(currentSumInIndex) ")
                if !resultSet.contains(currentSumInIndex + val) {
                    tempSet.insert(currentSumInIndex + val) //yes yes yes
                }
            }
        }
        print("1 sumset: \(resultSet.sorted()) | tempset: \(tempSet.sorted())")
        resultSet = resultSet.symmetricDifference(tempSet)
        print("2 sumset: \(resultSet) | tempset: \(tempSet)\n")
        tempSet.removeAll()
    }
    return resultSet.count - 1
}
let coins = [10, 50, 100]
let quantity = [1, 2, 1]
print(possibleSums(coins,quantity))

//let coins1 = [10, 50, 100, 500]
//let quantity1 = [5, 3, 2, 2]
//print(possibleSums(coins1,quantity1))

/*
 1 sumset: [0] | tempset: [10]
 2 sumset: [10, 0] | tempset: [10]

 1 sumset: [0, 10] | tempset: [50, 60, 100, 110]
 2 sumset: [0, 110, 50, 100, 60, 10] | tempset: [100, 110, 60, 50]

 1 sumset: [0, 10, 50, 60, 100, 110] | tempset: [150, 160, 200, 210]
 2 sumset: [60, 0, 100, 160, 110, 150, 50, 200, 10, 210] | tempset: [200, 160, 210, 150]

 9
 *//*
 
 1 sumset: [0, 10] | tempset: []
 1 sumset: [0, 10, 50, 60, 100, 110, 150, 160] | tempset: []
 1 sumset: [0, 10, 50, 60, 100, 110, 150, 160, 200, 210, 250, 260] | tempset: []
 11

 */
