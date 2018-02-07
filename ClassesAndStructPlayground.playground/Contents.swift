//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * 类和结构体是人们构建代码所用的一种通用且灵活的构造体
 */
/**
 * 类和结构体对比
 共同处在于
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 类还有如下的附加功能：
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 */
class SomeClass {
    // 在这里定义类
}
struct SomeStructure {
    // 在这里定义结构体
}
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
/**
 * 类和结构体实例
 */
let someResolution = Resolution()
let someVideoMode = VideoMode()
/**
 * 属性访问
 */
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
/**
 * 结构体类型的成员逐一构造器
 * 与结构体不同，类实例没有默认的成员逐一构造器。
 */
let vga = Resolution(width:640, height: 480)
/**
 * 结构体和枚举是值类型
 * 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now  \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")
/**
 * 类是引用类型
 */
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
/**
 * 恒等运算符
 * 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例
 等价于（===）
 不等价于（!==）
 */
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
/**
 * 类和结构体的选择
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 该数据结构的主要目的是用来封装少量相关简单数据值。
 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 该数据结构不需要去继承另一个既有类型的属性或者行为。
 */
var string1 = "string1"
var string2 = string1
string2 = "string2"
string1
var arr1 = ["a","b","c"]
var arr2 = arr1
arr2.append("d")
arr1

let tenEighty2 = VideoMode()
