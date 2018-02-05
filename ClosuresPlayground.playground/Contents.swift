//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
 * 闭包是自包含的函数代码块，可以在代码中被传递和使用
 * 全局函数是一个有名字但不会捕获任何值的闭包
 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 */
/**
 * 闭包表达式
 */
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
/**
 * 闭包表达式语法
 { (parameters) -> returnType in
 statements
 }
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
/**
 * 根据上下文推断类型
 */
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
/**
 * 单表达式闭包隐式返回
 */
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
/**
 * 参数名称缩写
 */
reversedNames = names.sorted(by: { $0 > $1 } )
/**
 * 运算符方法
 */
reversedNames = names.sorted(by: >)
/**
 * 尾随闭包
 * 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性
 */
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}
// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})
// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}
reversedNames = names.sorted() { $0 > $1 }
/**
 *如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
 */
reversedNames = names.sorted { $0 > $1 }
/**
 * 例子：：：
 */
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings 常量被推断为字符串类型数组，即 [String]
// 其值为 ["OneSix", "FiveEight", "FiveOneZero"]
/**
 * 值捕获
 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
var i1 = incrementByTen()
var i2 = incrementByTen()
/**
 * 闭包是引用类型
 */
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
/**
 * 逃逸闭包
 * 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出 "200"
completionHandlers.first?()
print(instance.x)
// 打印出 "100"
/**
 * 自动闭包
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// 打印出 "5"
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// 打印出 "5"
print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// 打印出 "4"
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// 打印出 "Now serving Alex!"
/**
 * 通过将参数标记为 @autoclosure 来接收一个自动闭包
 */
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
