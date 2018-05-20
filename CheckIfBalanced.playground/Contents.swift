//: Playground - noun: a place where people can play

import UIKit

/* check if string with brackets is balanced
 () - true
 (() - false
 ([]{}) - true
 ([)} - false
 [({})] - true
 }{ - false
 ()() - true
 */

struct Stack<T> {
    /*
     - pop - remove
     - push(item) - add
     - peek - return top element
     - isEmpty
     */
    
    private var elements = [T]()
    var count: Int {
        return elements.count
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }

    public mutating func push(_ item: T) {
        elements.append(item)
    }
    
    public mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        return elements.removeLast()
    }
    
    public mutating func removeLast() {
        guard !isEmpty else {
            return
        }
        
        elements.removeLast()
    }
    
    public func peek() -> T? {
        return elements.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}

func opositeBracket(_ ch: String) -> String? {
    let map = ["}": "{", ")": "(", "]": "["]
    return map[ch]
}

func isBalanced(_ str: String) -> Bool {
    guard str.count > 1 else {
        return false
    }
    
    var stack = Stack<String>()
    
    for ch in str {
        let strCh = String(ch)
        if stack.isEmpty {
            stack.push(strCh)
            continue
        }
        
        let lastElement = stack.peek()
        if lastElement == opositeBracket(strCh) {
            stack.removeLast()
        } else {
            stack.push(strCh)
        }
    }
    
    return stack.isEmpty
}

let str1 = "[({})]"
let str2 = "([)}"
let str3 = "()()"

isBalanced(str1)
isBalanced(str2)
isBalanced(str3)

