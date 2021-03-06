//
//  main.swift
//  Terry
//
//  Created by Terry Koo on 2022/05/29.
//
import Foundation

//var N = Int(readLine()!)!
//var check = N
//var index = 0
//var result = [Int]()
//var k: Int = 0
//
//var inputArr = readLine()!.split(separator: " ").map({Int($0)!})
//var indexArr = [Int]()
//
//var num = arr[0]
//arr.remove(at: 0)
//result.append(0+1)
//while arr.count != 0 {
//    if num > 0 {
//        result.append(num%arr.count+1)
//        num = arr.remove(at: num%arr.count)
//    } else {
//        result.append((arr.count+num)%arr.count)
//        num = arr.remove(at: abs((arr.count+num)%arr.count))
//    }
//}
//
//print(result)
//
//for i in 1..<N+1 {
//    indexArr.append(i)
//}
//
//k = inputArr.remove(at: index)
//result.append(indexArr.remove(at: index))
//
//while inputArr.count != 0 {
//    if k < 0 {
//        index = (index + k)%inputArr.count
//    } else {
//        index = (index + (k-1))%inputArr.count
//    }
//
//    k = inputArr.remove(at: index)
//    result.append(indexArr.remove(at: index))
//}
//
//print(result)

//let N = Int(readLine()!)!
//
//var balloon = readLine()!.split(separator: " ").enumerated().map{ ($0 ,Int(String($1))!) }
//var index = 0
//var answer = [Int]()
//
//while true {
//    var tmp = balloon[index].1
//    answer.append(balloon[index].0 + 1)
//    if tmp > 0 { tmp -= 1 }
//    balloon.remove(at: index)
//    index += tmp
//
//    if balloon.isEmpty { break }
//
//    index %= balloon.count
//
//    if index < 0 {
//        index += balloon.count
//    }
//}
//
//print(answer.map{ String($0) }.joined(separator: " "))

struct Deque<T> {
    var input = [T]()
    var output = [T]()

    var count: Int {
        return input.count + output.count
    }

    mutating func pushLeft(_ n: T) {
        output.append(n)
    }

    mutating func pushRight(_ n: T) {
        input.append(n)
    }

    mutating func popLeft() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()!
    }

    mutating func popRight() -> T {
        if input.isEmpty {
            input = output.reversed()
            output.removeAll()
        }
        return input.popLast()!
    }
}

// Balloon??? typealias ??????
typealias Balloon = (index: Int, next: Int)

// ?????? ??????
let N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int(String($0))! }

// ??? ??????
var balloons = Deque<Balloon>()

// enumerated??? ???????????? ????????? ?????? ?????? + ????????? ?????? ?????? ????????? ??????
for (index, next) in input.enumerated() {
    balloons.pushRight((index: index + 1, next: next))
}

// ?????? ????????? ???????????? ?????? ??????
var result = [Int]()

// ?????? ????????? ????????? ??????
var balloon: Balloon

// ?????? ????????????
while true {
    balloon = balloons.popLeft() // deque??? ????????? ?????? ????????? ????????????.
    result.append(balloon.index) // ????????? ??????
    if balloons.count == 0 { break } // queue??? ???????????? break
    
    // ???????????? ??? ????????? deque??? ??? ????????? ????????????.
    if balloon.next > 0 {
        for _ in 0..<(balloon.next - 1) {
            balloons.pushRight(balloons.popLeft())
        }
    } else {
        for _ in 0..<abs(balloon.next) { // ????????? ????????? deque??? ???????????? ????????? ???????????? ???????????? 1??? ??? ??????!
            balloons.pushLeft(balloons.popRight())
        }
    }
    print("[input] \(balloons.input) // [output] \(balloons.output)")
}

// ?????? ??????
print(result.map { String($0) }.joined(separator: " "))
