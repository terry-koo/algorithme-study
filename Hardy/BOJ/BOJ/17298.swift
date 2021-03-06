import Foundation

let n = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]() // 수열 A의 index 담기
for i in 0..<n {
  // 스택의 탑이 A[i]보다 작으면 A[i]는 NGE
  while !stack.isEmpty && A[stack.last!] < A[i]{
    A[stack.removeLast()] = A[i]
  }

  stack.append(i)
}

for i in stack {
  A[i] = -1
}

print(A.map { String($0) }.joined(separator: " "))
