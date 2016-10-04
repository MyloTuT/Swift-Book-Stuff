/*:“Control Flow
Swift provides a variety of control flow statements. These include "while" loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point of your code. 
 Swift also provides for-in that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences.
 Swif's 'switch' statement is also considerably more powerful than it's counterpart in many c-like languages. Because the cases of a switch statement do not fall through to the next case in 'Swift', it avoids common C errors caused by missing "break" statements. Cases can match many different patterns, including interval matches, tuples, and casts to a specific type. Matched values in a 'switch' case can be bounc to temporary constants or variables for use within the cases body, and complex matching conditions can be expressed with a "where" clause for each case.
*/
 
//: *For-In Loops
// You use the 'for-in' loop to iterate over a sequence, such as ranges of numbers, items in an array or characters in a string. 

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer*=base
}
print("(base) to the power of \(power) is \(answer)") //Prints "3 to the power of 10 is 59049"

// Use a for-in loop with an array to iterate over it's items
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(names)!")
}

// Iterating over a dictionary to access its key-value pairs. Each item in the dictionary is returned as a (key, value) tuple when the dictionary is iterated, and you can decompose the (key, value) tuple's memebers as explicityly named constants for use within the body of the for-in loop. 

let numberofLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legcount) in numberofLegs {
    print("\(animalName)s have \(legcount) legs")
}

//: *While Loops
// "A While Loop performs a set of statements until a condition becomes false.

//: ** While - evaluates the condition at the start of each pass through the loop
//: ** Repeat-While - evaluates its condition at the end of each pass through the loop

while true {
    //code goes here
}

repeat {
    //code goes here
} while true

//: * Conditional Statements
// It is often useful to execute different pieces of code based on certain conditions. You might want to run an extra piece of code when an error occurs. To do this you make parts of your code conditional. 

//: ** If
// "If" executes a set of statements only if that condition is true

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scar")
}

// ** If - Else
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scar.")
} else {
    print("It's not that cold. Wear a t-shirt")
}

// Chaining "If statements"
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32{
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen")
} else {
    print("It's not that cold. Wear a t-shirt")
}

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold out. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

//: ** Switch
// A switch statement considers a value and compares it against several possible matching patterns. It then executes an appropriate block of code, based ont he first pattern that matches successfully. 

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
    
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//: ** Interval Matching
// Values in switch cases can be checked for their inclusion in an interval. This example uses number intervals to provide a natural language count for numbers of any size

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


//: **Tuples
// You can use tuples to test multiple values in the same switch statement. Each element can be tested against a different value or interval of values. 

let somePoint = (1, 1)
switch somePoint {
case (0,0):
    print("(0,0) is at the origin")
case (_, 0):
    print("(\(somePoint.0) , 0 ) is on the x-axis")
case (0,_):
    print("(\(somePoint.0), \(somePoint.1) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

//: **Value Bindings
// A "Switch" case can bind the value or values it matches to temporary constants or variable, for use in the body of the case.
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
}

// **Where
// A "switch" case can use a "where" clause to check for additional conditions
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// **Compound Cases
// Multiple switch cases that shre the same body can be combined by writing several patterns after "case", with a comma between each of the patterns.
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s","t", "v", "w", "x", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//: * Control Transfer Statements
// 'Control transfer statements' change the order in which your code is executed, y transferring control from one piece of code to another. Swift has fire control transfer statements:
//: **continue - tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop. 
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
//: **break - ends execution of an entire control flow statement immediately. 'Break' can be used in a switch statement or loop statement.
    //: ***Break in a Loop Statement - ends the loop's execution immediately and transfers control to the first line of code after the loop's closing brace (})
    //: ***Break in a Switch Statement - causes the switch statement to end its execution immediately and to transfer control to the first line of code after the switch statement's closing brace
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


//: **Fallthrough - swift does not fall through by default like C.
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer"
}

//: **return
//: **throw

//: *Labeled Statements
// A labeled statement is used to be specific about which loop (in a nested loop situation) you want to break, or continue. 
let finalSquare = 25
var board = [Int] (repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board [09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -08
var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")

//: * Early Exit
// A 'guard' statement, like an if statement, executes statements depending on the Boolen value of an expression. You use a 'guard' statement to require that a condition must be true in order for the code after the 'guard' statment to be executed. Unlike an if statement, a guard statement always has an else clause - the code inside the else clause is executed if the condition is not true. 
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "New York City"])

//: * Checking API Availability
// Swift has built-in support for checking API availablity, which ensures that you don't accidentally use APIs that are unavailable on a given deployment target. 
// You use an availability condition in an if or guard statement to conditionally execute a block of code, depending on whether the APIs you want to use are available at runtime. 
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}