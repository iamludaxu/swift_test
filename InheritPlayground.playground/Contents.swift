//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * 定义一个基类
 * 不继承于其它类的类，称之为基类。
 */
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}
let someVehicle = Vehicle()
/**
 * 子类生成
 */
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// 打印："Tandem: traveling at 22.0 miles per hour"
/**
 * 重写
 * 访问超类的方法，属性及下标
 在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或下标：
 
 在方法someMethod()的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod()方法。
 在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
 在下标的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标。
 */
/**
 * 重写方法
 */
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
/**
 * 重写属性的 Getters 和 Setters
 */
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
/**
 * 重写属性观察器
 */
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
/**
 * 防止重写
 * 你可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。
 */
