//: Playground - noun: a place where people can play

import UIKit


var arr = [1,2,3,4,5,6,7]
func rotate(arr: inout [Int], d: Int) {
    for i in 0..<d {
        let tmpRemoved = arr.removeFirst()
        arr.append(tmpRemoved)
    }
}

rotate(arr: &arr, d: 2)
print(arr)
