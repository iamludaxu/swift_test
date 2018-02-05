//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
 * 函数是一段完成特定任务的独立代码片段
 */
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
/**
 * 函数参数与返回值
 * 无参数函数
 */
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
/**
 * 多参数函数
 */
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
/**
 * 无返回值函数
 */
func greet1(person: String) {
    print("Hello, \(person)!")
}
greet1(person: "Dave")
/**
 *被调用时，一个函数的返回值可以被忽略
 */
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// 打印 "hello, world" 并且返回值 12
printWithoutCounting(string: "hello, world")
// 打印 "hello, world" 但是没有返回任何值
/**
 * 多重返回值函数
 */
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let (min,max) = minMax(array: [1,23,3])
/**
 * 可选元组返回类型
 */
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax2(array: []) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
/**
 * 函数参数标签和参数名称
 每个函数参数都有一个参数标签( argument label )以及一个参数名称( parameter name )。参数标签在调用函数的时候使用；调用的时候需要将函数的参数标签写在对应的参数前面。参数名称在函数的实现中使用。
 */
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(firstParameterName: 1, secondParameterName: 2)
func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName 代表参数值
}
func greet2(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet2(person: "Bill", from: "Cupertino"))
/**
 * 这里的from就是一个标签
 * 参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍保持了函数内部的可读性以及清晰的意图
 */
/**
 * 忽略参数标签
 */
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)
/**
 * 默认参数值
 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12
/**
 * 可变参数
 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
/**
 * 输入输出参数
 *
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
/**
 * 函数类型
 */
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/**
 * 可以解读为“这个函数类型有两个 Int 型的参数并返回一个 Int 型的值。”。
 使用函数类型
 */
var mathFunction : (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
/**
 * 函数类型作为参数类型
 */
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
/**
 * 函数类型作为返回类型
 */
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
/**
 * 嵌套函数
 */
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward2(input: Int) -> Int { return input + 1 }
    func stepBackward2(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward2 : stepForward2
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}
print("zero!")
