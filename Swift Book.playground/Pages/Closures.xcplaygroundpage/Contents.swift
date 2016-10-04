//: Closures
// Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages
// Closures take one of three forms
//: *** Global functions are closures that have a name and do not capture any values
//: *** Nested functions are closures that have a name and can capture values from their enclosing function
//: *** Closure expressions are unnamed closures writtin in a lightweight syntax that can capture values from their surrounding context.

//: *Closure Expressions
// Nested functions, as introduced in Nested Functions are a convenient means of naming and defining  self-contained blocks of code as part of a larger function. However, it is sometimes useul to write shorter versions of function-like constructs without a full declaration and name. This is particularly true when you work with functions or methods that take functions as one or more of their arguments.

// Closure Expressions are a way to write inline closures in a brief, focused syntax. Closure expressions provide several syntax optimizations for writing closures in a shorted form without loss of clarity or intent. 

// The Sorted Method
// Swift's standard library provides a method called "sorted(by:), which sorts an array of values of a known type, based on the output of a sorting closure that you provide. Once it completes the sorting process, the sorted(by:) method returns a new array of the same type and size as the old one, with its elemens in the corret sorted order. 



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}


//: *Closure Expression Syntax form:

//  { (parameters) -> returnType in
//      statements
//  }
var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
                 return s1 > s2
})

// The start of the closures body is introduced by the 'in' keyword.
reversedNames = names.sorted(by: { (s1:String, s2:String) -> Bool in return s1 > s2 } )

//Inferring Type From Context
// Because the sorting closure is passed as an argument to a method, Swift can infer the types of it's parameters and the type of the value it returns. The sorted(by:) method is being called on an array of strings, so it's argument must e a function type(string, string) -> Bool. This means that the (String, String) and Bool types do not need to be written as part of the closure expression's definition.

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

//Implicit Returns from Single-Expression Closures
// Single-expression closures can implicitly return the result of their single expression by omiting the 'return' keyword from their declaration
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//: **Shorthand Argument Names
//Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure's arguments by the names $0, $1, $2 and so on. 

reversedNames = names.sorted(by: { $0 > $1 } ) //here $0 and $1 refer to the closure's first and second 'String' arguments

//: **Operator Methods
// A shorter way to write methods. Swifts string type defines it's string-specific implementation of the greater-than operator as a method.

reversedNames = names.sorted(by: >)

//: **Trailing Closures
// If you need to pass a closure expression to a function as the function's final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A 'trailing closure' is written after the funtions call's parentheses, even though it is still an argument to the function. 

func someFunctionThatTakesAClosure(closure: () -> Void) {
    //function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure:  {
    //closure's body goes here
})

// Here's how you call this function with a trailing closure instead: 

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

reversedNames = names.sorted() { $0 > $1 }

// If a closures expression is provided as the function or method's only argument and you provide that expression as a trailing closure, you don not need to write a pair of parentheses() after the functions or method

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510] //Creates a new array ["OneSix", "FiveEight", "FiveOneZero"]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

//: * Capturing Values
// A closure can capture constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables from within it's body, even if the original scope that defined the constants and variables no longer exist. 

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

var plusPlus = makeIncrementer(forIncrement: 2)
makeIncrementer(forIncrement: 20)

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

//: * Closures Are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

//: *Escaping Closures
// A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write '@escaping before the parameter's type to indicate that the closure is allowed to escape.

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonesapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } //escaping closure, it needs to refer to self explicityly
        someFunctionWithNonesapingClosure { x = 200 } // nonescaping closure. It refers to self implicitly
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

//: *Autoclosures
//An autoclosure is a closure that is automatically created to wrap an expression that's being passed as an argument to a function. It doesn't take any arguments, and when it's called, it returns the value of the expression that's wrapped inside of it. 

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)


func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

//If you want an autoclosure that is allowed to escape, use both the @autoclosure and @escaping attributes.
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}


//Closure as a variable

var cName: () -> String

//Closure as an optional variable
var cloName: (() -> String)?

//Closure as an TypeAlias
typealias closName = () -> String








