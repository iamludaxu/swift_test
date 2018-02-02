//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 *
 Swift提供了多种流程控制结构，包括可以多次执行任务的while循环，基于特定条件选择执行不同代码分支的if、guard和switch语句，还有控制流程跳转到其他代码位置的break和continue语句。
 
 Swift 还提供了for-in循环，用来更简单地遍历数组（array），字典（dictionary），区间（range），字符串（string）和其他序列类型。
 */
/**
 * For-In 循环
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
/**
 * 如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值
 */
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
/**
 * 遍历一个数组所有元素
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
/**
 * While 循环
 while循环，每次在循环开始时计算条件是否符合；
 repeat-while循环，每次在循环结束时计算条件是否符合。
 */
let end = 10
var index = 10
while index < end {
    print("index:\(index)")
    index += 1
}
print("Game over!")
/**
 * Repeat-While
 */
index = 10
repeat{
    print("index:\(index)")
    index += 1
} while index < end
/**
 * If
 */
var temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
/**
 * Switch
 */
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
/**
 * 单个case同时匹配a和A，可以将这个两个值组合成一个复合匹配，并且用逗号分开
 */let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
/**
 * 区间匹配
 */
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
/**
 * 元组
 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
/**
 * 值绑定（Value Bindings）
 case 分支允许将匹配的值绑定到一个临时的常量或变量，并且在case分支体内使用 —— 这种行为被称为值绑定（value binding），因为匹配的值在case分支体内，与临时的常量或变量绑定
 */
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
/**
 * Where
 case 分支的模式可以使用where语句来判断额外的条件
 */
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
/**
 * 复合匹配
 */
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
/**
 * 控制转移语句
 * Continue
 */
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
/**
 * Break
 */
for index in 1...5 {
    if index > 2 {
        break
    }
    print(index)
}

/**
 * 贯穿
 * fallthrough
 */
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
/**
 * 带标签的语句
 break gameLoop语句跳转控制去执行while循环体后的第一行代码，意味着游戏结束
 continue gameLoop语句结束本次while循环，开始下一次循环
 */
var start = 0
gameLoop : while start < end{
    start += 1
    if start == 4 {
        break gameLoop
    }
}
/**
 * 提前退出
 像if语句一样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else从句，如果条件不为真则执行else从句中的代码。
 */
func greet(person: [String: String]) {
    if let name = person["name"] {
        print("Hello \(name)")
    } else {
        return
    }
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person:["name": "John"])
// 输出 "Hello John!"
// 输出 "I hope the weather is nice near you."
greet(person:["name": "Jane", "location": "Cupertino"])
// 输出 "Hello Jane!"
// 输出 "I hope the weather is nice in Cupertino."

