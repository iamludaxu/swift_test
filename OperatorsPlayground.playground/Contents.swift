//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * 术语
 * 一元运算符对单一操作对象操作（如 -a）。一元运算符分前置运算符和后置运算符，前置运算符需紧跟在操作对象之前（如 !b），后置运算符需紧跟在操作对象之后（如 c!）。
 二元运算符操作两个操作对象（如 2 + 3），是中置的，因为它们出现在两个操作对象之间。
 三元运算符操作三个操作对象，和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符（a ? b : c）。
 * 赋值运算符
 */
let b = 10
var a = 5
a = b
/**
 * 赋值的右边是一个多元组
 */
let (x, y) = (1, 2)
/**
 * 算术运算符
 */
1 + 2       // 等于 3
5 - 3       // 等于 2
2 * 3       // 等于 6
10.0 / 2.5  // 等于 4.0
/**
 * Swift 默认情况下不允许在数值运算中出现溢出情况
 * 可以使用 Swift 的溢出运算符来实现溢出运算（如 a &+ b）
 */
var maxValue = Int.max &+ 1
/**
 * 求余运算符
 */
9 % 4    // 等于 1
-9 % 4   // 等于 -1
/**
 * 在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的。
 */
-9 % -4
/**
 * 一元负号运算符
 */
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"
/**
 * 一元正号运算符
 * 虽然一元正号符什么都不会改变，但当你在使用一元负号来表达负数时，你可以使用一元正号来表达正数，如此你的代码会具有对称美。
 */
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
/**
 * 组合赋值运算符
 */
var a1 = 1
a1 += 2
/**
 * 比较运算符
 *  Swift 也提供恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例。
 */
1 == 1   // true, 因为 1 等于 1
2 != 1   // true, 因为 2 不等于 1
2 > 1    // true, 因为 2 大于 1
1 < 2    // true, 因为 1 小于2
1 >= 1   // true, 因为 1 大于等于 1
2 <= 1   // false, 因为 2 并不小于等于 1
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
/**
 * 当元组中的值可以比较时，你也可以使用这些运算符来比较它们的大小
 * 比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的
 */
(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
/**
 * 三目运算符
 */
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
/**
 * 空合运算符
 * 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。
 */
var a2 :Int?
a2 ?? 2
/**
 * 空合运算符是对以下代码的简短表达方法
 */
a2 != nil ? a2! : 2
/**
 * 闭区间运算符
 * 闭区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间
 */
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
/**
 * 半开区间运算符
 * 半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
/**
 * 逻辑运算符
 * 逻辑非运算符
 */
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
/**
 * 逻辑与运算符
 */
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/**
 * 逻辑或运算符
 */
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/**
 * 逻辑运算符组合计算
 * Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。
 * 为了一个复杂表达式更容易读懂，在合适的地方使用括号来明确优先级是很有效的，虽然它并非必要的
 */
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}


