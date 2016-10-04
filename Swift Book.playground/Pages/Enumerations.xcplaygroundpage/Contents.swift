//: Enumerations
// An enumerations defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code. They adopt many features traditionally supported only by classes, such as computed properties to provide additional information about the enumeration's current value, and instance methods to provide functionality related to the values the enumeration represents. 
//: * Enumeration Syntax
enum SomeEnumeration {
    //enumeration definition goes here
}

enum CompassPoint {
    case north //this is a enumeration case
    case south //so is this....and so on
    case east
    case west
}

//Multiple cases can appear on a single line
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east //Swift allows you to drop the type after it is already assigned

//: * Matching Enumeration Values with a Switch Statement
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

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//: * Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem),\(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

//: * Raw Values
// 'Raw Values' the default value of a prepopulated enumeration cases

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//: * Implicitly Assigned Raw Values
// When you're working with enumerations that store integer or string raw values, you don't have to explicitly assign a raw value for each case. When you don't Swift will automatically assign the values for you. 

enum newPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum Compass: String {
    case north, south, east, west
}

// You access the raw value of an enumeration case with its rawValue property

let earthsOrder = newPlanet.earth.rawValue
let sunsetDirection = Compass.west.rawValue

//: *Initializing from a Raw Value
// If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value's type (as a parameter called rawValue) and returns either an enumeration case or nil. 

let possiblePlanet = newPlanet(rawValue: 7)

let positionToFind = 11
if let posPlanet = newPlanet(rawValue: positionToFind) {
    switch posPlanet {
    case .earth:
        print("Mostly harmless")
    default:
        ("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//: * Recursive Enumerations
// A 'recursive enumeration' is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enum case is recursive by writing "indirect" before it.

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// You can also write an indirect before the beginning of the enum
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression2.number(5)
let four = ArithmeticExpression2.number(4)
let sum = ArithmeticExpression2.addition(five, four)
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


