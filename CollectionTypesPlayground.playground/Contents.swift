//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
 * Swift 语言提供Arrays、Sets和Dictionaries三种基本的集合类型用来存储集合数据。数组（Arrays）是有序数据的集。集合（Sets）是无序无重复数据的集。字典（Dictionaries）是无序的键值对的集。
 *如果创建一个Arrays、Sets或Dictionaries并且把它分配成一个变量，这个集合将会是可变的。这意味着我们可以在创建之后添加更多或移除已存在的数据项，或者改变集合中的数据项。如果我们把Arrays、Sets或Dictionaries分配成常量，那么它就是不可变的，它的大小和内容都不能被改变。
 */
/**
 * 数组(Arrays)
 * 创建一个空数组
 */
var someInts = [Int]()
someInts = Array<Int>()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
/**
 *
 */
someInts = []
/**
 * 创建一个带有默认值的数组
 */
var threeDoubles = Array(repeating: 0.0, count: 3)
/**
 * 用数组字面量构造数组
 */
var shoppingList: [String] = ["Eggs", "Milk"]
/**
 * 添加数据项
 */
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
/**
 * 获取数据
 */
var firstItem = shoppingList[0]
/**
 * 修改数据
 */
shoppingList[0] = "Six eggs"
/**
 * 批量修改数据
 */
shoppingList[4...6] = ["Bananas", "Apples"]
/**
 * 某个具体索引值之前添加数据项
 */
shoppingList.insert("Maple Syrup", at: 0)
/**
 * 移除某个具体项
 */
let mapleSyrup = shoppingList.remove(at: 0)
/**
 * 数组的遍历
 * 可以用for-in
 */
for item in shoppingList {
    print(item)
}
/**
 * 每个数据项的值和索引值
 */
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
/**
 * 集合（Sets）
 * 创建和构造一个空的集合
 */
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
/**
 * 插入数值
 */
letters.insert("a")
/**
 * 原来的是Set类型现在还是Set类型
 */
letters = []
/**
 * 用数组字面量创建集合
 */
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
/**
 * 访问和修改一个集合
 */
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
favoriteGenres.insert("Jazz")
/**
 * 移除某个元素
 */
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
/**
 * 检查Set中是否包含一个特定的值
 */
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
/**
 * 遍历一个集合
 * for-in循环中遍历
 */
for genre in favoriteGenres {
    print("\(genre)")
}
/**
 * Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法
 */
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
/**
 * 集合操作
 使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
 使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
 使用union(_:)方法根据两个集合的值创建一个新的集合。
 使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
 */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
/**
 * 集合成员关系和相等
 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
 */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
/**
 * 字典
 * 其中Key是字典中键的数据类型，Value是字典中对应于这些键所存储值的数据类型
 * 创建一个空字典
 */
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
/**
 * 用字典字面量创建字典
 */
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
/**
 * 访问和修改字典
 */
print("The dictionary of airports contains \(airports.count) items.")
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
/**
 * 使用一个恰当类型的键作为下标索引,分配恰当类型的新值
 */
airports["LHR"] = "London"
/**
 * 可以使用下标语法来改变特定键对应的值
 */
airports["LHR"] = "London Heathrow"
/**
 * updateValue(_:forKey:)方法会返回对应值的类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。
 * 字典的下标访问会返回对应值的类型的可选值
 */
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
/**
 * 使用下标语法来通过给某个键的对应值赋值为nil来从字典里移除一个键值对
 */
airports["APL"] = "Apple Internation"
// "Apple Internation" 不是真的 APL 机场, 删除它
airports["APL"] = nil
/**
 * removeValue(forKey:)方法也可以用来在字典中移除键值对
 */
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
/**
 * 字典遍历
 */
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
/**
 * 通过访问keys或者values属性，我们也可以遍历字典的键或者值
 */
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}
/**
 * 如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例的 API 的参数，可以直接使用keys或者values属性构造一个新数组
 */
let airportCodes = [String](airports.keys)
// airportCodes 是 ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames 是 ["Toronto Pearson", "London Heathrow"]
/**
 *了以特定的顺序遍历字典的键或值，可以对字典的keys或values属性使用sorted()方法
 */
 var ss = [String](airports.values).sorted()
