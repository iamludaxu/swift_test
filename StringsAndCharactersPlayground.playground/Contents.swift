//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
 * 字符串字面量
 */
let someString = "Some string literal value"
/**
 * 初始化空字符串
 */
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
/**
 * 可以通过检查其Bool类型的isEmpty属性来判断该字符串是否为空
 */
if emptyString.isEmpty {
    print("Nothing to see here")
}
/**
 * 字符串可变性
 * 在 Objective-C 和 Cocoa 中，您需要通过选择两个不同的类(NSString和NSMutableString)来指定字符串是否可以被修改。
 */
var variableString = "Horse"
variableString += " and carriage"
/**
 * 字符串是值类型
 * Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值
 */
/**
 * 使用字符
 */
for character in "Dog!🐶".characters {
    print(character)
}
/**
 * 通过标明一个Character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量
 */
let exclamationMark: Character = "!"
/**
 * 字符串可以通过传递一个值类型为Character的数组作为自变量来初始化
 */
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
/**
 * 连接字符串和字符
 */
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
var instruction = "look over"
instruction += string2
/**
 * 可以用append()方法将一个字符附加到一个字符串变量的尾部
 */
welcome.append(exclamationMark)
welcome.append("other String")
/**
 * 字符串插值
 */
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
welcome.insert("3", at: welcome.startIndex)
/**
 * Unicode
 * 字符串字面量的特殊字符
 */
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上
/**
 * 计算字符数量
 */
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
/**
 * 注意在 Swift 中，使用可拓展的字符群集作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量。
 */
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in cafe is 4"
word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.characters.count)")
/**
 * 字符串索引
 .startIndex
 /// The position of the first character in a nonempty string.
 ///
 /// In an empty string, `startIndex` is equal to `endIndex`.
 .endIndex
 /// A string's "past the end" position---that is, the position one greater
 /// than the last valid subscript argument.
 ///
 /// In an empty string, `endIndex` is equal to `startIndex`.
 */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
/**
 * 插入和删除
 */
welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
/**
 * 调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串
 */
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
/**
 * 比较字符串
 * Swift 提供了三种方式来比较文本值：字符串字符相等、前缀相等和后缀相等。
 * 字符串/字符相等
 */
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
/**
 * 前缀/后缀相等
 */
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
/**
 * 字符串的 Unicode 表示形式
     D U+0044
     o U+006F
     g U+0067
     ‼ U+203C
     🐶 U+1F436
 */
let dogString = "Dog‼🐶"
dogString.count
/**
 * UTF-8 表示
 */
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
/**
 * UTF-16 表示
 */
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
/**
 * Unicode 标量表示
 */
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
