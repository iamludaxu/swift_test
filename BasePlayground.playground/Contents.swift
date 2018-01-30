//: Playground - noun: a place where people can play

import UIKit

/**
 * 常量和变量
 * 常量的值一旦设定就不能改变，而变量的值可以随意更改
 * 声明方式
 */
let max = 10
var x = 1, y = 1.0
/**
 * 类型标注
 * 冒号代表着“是...类型”
 */
var stringVar : String
/**
 * 常量和变量命名
 * 常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
 */
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
/**
 * 输出常量和变量
 */
var printVal = "打印出来"
print("printVal: \(printVal)")
/**
 * 注释
 * 单行注释以双正斜杠（//）
 * 多行注释单个正斜杠后跟随一个星号（/*），终止标记为一个星号后跟随单个正斜杠（*/）
 */
/**
 * 分号，不强制要去以分号（;）断句，但是同一行有多条独立语句必须用
 */
let cat = "猫";print(cat)
/**
 * 整数
 * 提供了8，16，32和64位的有符号和无符号整数类型
 * 整数范围
 */
let minValue = UInt8.min
let maxValue = UInt8.max
/**
 * 一般来说不用指定长度，只用用Int，长度和当前平台的原生字长相同
 * 在32位平台上，Int 和 Int32 长度相同。
 * 在64位平台上，Int 和 Int64 长度相同。
 */
let intMinValue = Int.min
let intMaxValue = Int.max
/**
 * 一个特殊的无符号类型 UInt
 * 最好使用Int，即使你要存储的值已知是非负的。统一使用Int可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断
 */
/**
 * 浮点数
 * Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
 * Float表示32位浮点数。精度要求不高的话可以使用此类型。
 */
var doubleVal : Double = 2.3
var floatVal : Float = 2.3
/**
 * 类型安全和类型推断
 * meaningOfLife 会被推测为 Int 类型
 */
let meaningOfLife = 42
/**
 * 当推断浮点数的类型时，Swift 总是会选择 Double 而不是Float
 * pi 会被推测为 Double 类型
 */
let pi = 3.14159
/**
 * 同时出现了整数和浮点数，会被推断为 Double 类型
 * anotherPi 会被推测为 Double 类型
 */
let anotherPi = 3 + 0.14159
/**
 * 数值型字面量
 * 一个十进制数，没有前缀
 * 一个二进制数，前缀是0b
 * 一个八进制数，前缀是0o
 * 一个十六进制数，前缀是0x
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17
/**
 * 十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定；十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定。
 * 1.25e2 表示 1.25 × 10^2，等于 125.0。
 * 1.25e-2 表示 1.25 × 10^-2，等于 0.0125。
 * 0xFp2 表示 15 × 2^2，等于 60.0。
 * 0xFp-2 表示 15 × 2^-2，等于 3.75。
 */
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
/**
 * 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量
 */
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
/**
 * SomeType(ofInitialValue) 是调用 Swift 构造器并传入一个初始值的默认方法
 */
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
/**
 * 整数和浮点数转换
 */
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
/**
 * 类型别名
 */
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
/**
 * 布尔值
 */
let orangesAreOrange = true
let turnipsAreDelicious = false
/**
 * 元组
 */
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
/**
 * 可以把要忽略的部分用下划线（_）标记
 */
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
/**
 * 可以通过下标来访问元组中的单个元素
 */
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
/**
 * 可选类型
 */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
/**
 * convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
 */
var serverResponseCode: Int? = 404
//serverResponseCode = nil
print(serverResponseCode)
/**
 * if 语句以及强制解析
 */
if convertedNumber != nil {
    print("convertedNumber contains some integer value\(convertedNumber!).")
}
/**
 * 可选绑定
 * 使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量
 */
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
/**
 * 包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行
 */
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
/**
 * 隐式解析可选类型(implicitly unwrapped optionals)
 * 想要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型
 */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号
/**
 * 如果这里不加: String!就会报错
 */
var ii : String! = "ddd"
if let ss = ii{
    print(ss)
}
/**
 * 错误处理
 * 当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。
 */
func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}
/**
 * 一个函数可以通过在声明中添加throws关键词来抛出错误消息。当你的函数能抛出错误消息时, 你应该在表达式中前置try关键词。
 */
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
/**
 * 使用断言进行调试 变成-3
 */
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
