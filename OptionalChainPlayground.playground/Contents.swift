//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
 * 使用可选链式调用代替强制展开
 */
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
let john = Person()
//let roomCount = john.residence!.numberOfRooms
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
/**
 * 为可选链式调用定义模型类
 */
class Person0 {
    var residence: Residence0?
}
class Residence0 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) { self.name = name }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
/**
 * 通过可选链式调用访问属性
 * 这意味着可选链式调用失败时，等号右侧的代码不会被执行
 */
let john0 = Person0()
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john0.residence?.address = someAddress
func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john0.residence?.address = createAddress()
/**
 * 通过可选链式调用访问下标
 */
let johnsHouse = Residence0()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john0.residence = johnsHouse

if let firstRoomName = john0.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
/**
 * 连接多层可选链式调用
 如果你访问的值不是可选的，可选链式调用将会返回可选值。
 如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选”。
 因此：
 通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
 类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。
 */
if let johnsStreet = john0.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
/**
 * 在方法的可选返回值上进行可选链式调用
 */
if let buildingIdentifier = john0.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
if let beginsWithThe =
    john0.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
