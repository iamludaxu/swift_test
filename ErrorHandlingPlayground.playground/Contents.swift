//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
 * 错误处理（Error handling）是响应错误以及从错误中恢复的过程。
 * 表示并抛出错误
 */

enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
/**
 * 处理错误
 * Swift 中有4种处理错误的方式
 把函数抛出的错误传递给调用此函数的代码、
 用do-catch语句处理错误、
 将错误作为可选类型处理、
 者断言此错误根本不会发生
 */
/**
 * 用 throwing 函数传递错误
 * 一个标有throws关键字的函数被称作throwing 函数。
 */
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
/**
 * 用 Do-Catch 处理错误
 do {
 try expression
 statements
 } catch pattern 1 {
 statements
 } catch pattern 2 where condition {
 statements
 }
 */
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
/**
 * 将错误转换成可选值
 * 可以使用try?通过将错误转换成一个可选值来处理错误。
 * 在下面的代码中,x和y有着相同的数值和等价的含义
 */
func someThrowingFunction() throws -> Int {
    // ...
    return 1
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
/**
 * 禁用错误传递
 * 你可以在表达式前面写try!来禁用错误传递
 */
//let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
/**
 * 指定清理操作
 第一条defer语句中的代码会在第二条defer语句中的代码被执行之后才执行
 */
func processFile(filename: String) throws {
    print("befor defer filename:\(filename)")
    defer {
        print("defer 1")
        print("defer 2")
        print("defer 3")
    }
    print("after defer")
    
}

try! processFile(filename: "dd")
