//: Functions
// 'Functions' are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to "call the function to perform its task when needed."

//: *Defining and Calling Functions
// When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output when it is done, known as its return type.

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

//: * Function Parameters and Return Values
func sayHelloWold() -> String {
    return "hello, world"
}
print(sayHelloWold())

//: * Functions with Multiple Parameters
// Functions can have multiple input parameters, which are writtern within the function's parentheses, separated by commas. 
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greetAgain(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

//: * Functions Without Return Values
// Functions are not required to define a return type. Here's a version of the greet(person:) functions, which prints its own "String" value rather than returning it: 
func greet1(person: String) {
    print("Hello, \(person)!")
}
greet1(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

//: * Functions with Multiple Return Values
// You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

var bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//: * Optional Tuple Return Types
// If the tuple type to be returned from a function has the potential to have "no value" for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. 

func minMax (array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//: *Function Argument Labels and Parameter Names
// Each function parameter has both an argument label and parameter name. 
func someFuntion(firstParameterName: Int, secondParameterName: Int) {
    
}
someFuntion(firstParameterName: 0, secondParameterName: 0)

//: ** Specifying Argument Labels
// You write an arugument label before the parameter name, separated by a space:
func someFuntion2(argumentLabel parameterName: Int) {
    
}

//: ** Omitting Argument Labels
// If you don't want an argument label for a parameter, write and '_' instead of an explicit argument label for that parameter
func someFuntion3(_ firstParameterName: Int, secondParameterName: Int) {
    
}

//: ** Default Parameter Values
// You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter's type. If a default value is defined, you can omit that parameter when calling the function.

//: ** Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters(...) after the parameter's type name. 
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

// In-Out Parameters
// Funtion parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can't change the value of a parameter by mistake. 

func swaptTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swaptTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: * Funtions Types
// A function has a specific funtion type, made up of the parameters types and the return type of the function. The type of this funtion is "() -> Void" or a function that has no parameters, and returns "Void"

//: ** Using Function Types
// You use function types just like any other types in Swift. You can define a constant or variable to be of a function type and assign an appropriate function to that variable

//: ** Function Types as Parameter Types
// You can use a function type such as "(Int, Int) -> Int" as a parameter type for another function.
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

//: **Function Types as Return Types
// You can use a function type as a return type of another function. You do this by writing a complete function type immediately after the return arrow(->) of the returning function. 

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> (Int) {
    return backward ? stepBackward: stepForward
}
var currentValue = 3
var moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

//: * Nested Functions
// All of the functions you have encountered so far in this chapter have been examples of 'global functions', which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions. 

func chooseStepFuntions(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward: stepForward
}
currentValue = -4
moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
		