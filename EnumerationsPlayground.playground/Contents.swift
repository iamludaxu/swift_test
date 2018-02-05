//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * 枚举为一组相关的值定义了一个共同的类型
 * 在 Swift 中，枚举类型是一等（first-class）类型
 */
/**
 * 枚举语法
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}
/**
 * 多个成员值可以出现在同一行上，用逗号隔开
 */
enum Planet1 {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/**
 *
 */
var directionToHead = CompassPoint.west
/**
 * 当类型已知时
 */
directionToHead = .east
/**
 * 使用 Switch 语句匹配枚举值
 */
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
/**
 * 关联值
 * 枚举的这种特性跟其他语言中的可识别联合（discriminated unions），标签联合（tagged unions），或者变体（variants）相似
 */
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
/**
 * 如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个let或者var
 */
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
/**
 * 原始值的隐式赋值
 * 如果第一个枚举成员没有设置原始值，其原始值将为0
 */
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/**
 * 使用枚举成员的rawValue属性可以访问该枚举成员的原始值
 */
let earthsOrder = Planet.earth.rawValue
//let sunsetDirection = CompassPoint.west
/**
 * 使用原始值初始化枚举实例
 */
let possiblePlanet = Planet(rawValue: 7)
/**
 * 如果你试图寻找一个位置为11的行星，通过原始值构造器返回的可选Planet值将是nil
 */
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
/**
 * 递归枚举
 * 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值
 * 你可以在枚举成员前加上indirect来表示该成员可递归
 * 也可以在枚举类型开头加上indirect关键字来表明它的所有成员都是可递归
 */
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
/**
 * 用ArithmeticExpression这个递归枚举创建表达式(5 + 4) * 2
 */
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
