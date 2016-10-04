import Foundation

//:Constants and variables

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

//:Type Annotations
var welcomeMessage: String
var red, green, blue: Double

//:Naming Constants & Variables

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

let 🐣 = "chick in an egg"
🐣
🐣
🐣

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!" //friendly Welcome is now "Bonjour!"

let languageName = "Swift" //languageName cannont be changed

print(friendlyWelcome) //Prints "Bonjour!"

print("The current value of friendlyWelcome is \(friendlyWelcome)")

//:Comments
//This is a comment

//Multiline Comments
/*
 here 
 here
 here
 end */

//Semicolons
let cat = "😸"; print(cat) //prints "😸"

//:Integers = whole numbers with no fractional component, such as 42 and -23.

//Integer Bounds
let minValue = UInt8.min // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max //maxValue is equal to 255, and is of type UInt8

/*Floating-Point Numbers
 Numbers with a fractional component like 3.14159, 0.1, and -273.15 */

//:Type Safety & Type Inference

let meaningOfLife = 42 //meaningOfLife is inferred to be of type Int
var pi = 3.14159 //pi is inferred to be of type Double

let anotherPi = 3 + 0.14159 //anotherPi is also inferred to be of type Double

//:Numeric Literals

let decimalInteger = 17
let binaryInteger = 0b1001 //17 in binanry notation
let ocatlInteger = 0o21 //17 in octal notation
let hexadecimalInteger = 0x11 //17 in hexadecimal notation

//exp
1.25e2
1.25e-2

0xFp-2
0xFp2

let deimalDouble = 12.1875
let exponenetDouble = 1.21875e1
let hexadecimalDouble = 0xc.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000_000.00_000_1

//Numerica Type Conversion

//:Integer Conversion
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourONeFieNine = 0.14159
pi = Double(three) + pointOneFourONeFieNine //pi equals 3.14159, and is inferred to be type Double

let integerPi = Int(pi) //integerPi equals 3, and is inferred to be of type Int

//:Type Aliases

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min //maxAmplitudeFound is now 0 

//:Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
}
else {
    print("Eww, turninps are horrible")
}

let i = 1
if i == 1 {
    print("correct")
}

//:Tuples
let http404Error = (404, "Not Found") //https404Error is of type (Int, String), and equals (404, "Not Found")

let (statusCode, statusMessage) = http404Error // Prints "The status code is 404"
print("The status message is \(statusMessage)") // Prints "The status message is Not Found" 

let (justTheStatusCode, _) = http404Error //Prints "The status code is 404"
print("The status code is \(http404Error.0)")

let http200Status = (statusCode: 200, description: "Ok")
print("The status code is \(http200Status.statusCode)") //Prints "The status cod eis 200"
print("The status message is \(http200Status.description)")

//:Optionals
//You use Optionals in situations where a value maybe absent. Either there is a value and you can unwrap the optional to access that value,, or there isn't a value at all.

var serverResponseCode: Int? = 404 //serverResponseCode contains an actual Int value of 404
serverResponseCode = nil //serverResponsecode now contains no value

var surveyAnswer: String? //surveyAnswer is automatically set to nil

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber contains some integer value of \(convertedNumber!).")
}

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" cound not be converted to an integer")
}

serverResponseCode = nil

//:If Statements and Forced Unwrapping

if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//: Optional Binding
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\"(possibleNumber)\" could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

let possibleString: String? = "An optional string"
let forcedString: String = possibleString! //requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString //no need for an exclamation mark

if assumedString != nil {
    print(assumedString)
} //Prints "An implicitly unwrapped optional string"

if let definiteString = assumedString {
    print(definiteString)
}// Prints "An implicitly unwrapped optional string."


//: Error Handling
// You use error handling to respond to error conditions your program may encounter during execution

func canThrowAnError() throws {
    //this function may or may not throw an error
}

do {
    try canThrowAnError()
    //no error was thrown
} catch {
    //an error was thrown
}
func makeASandwich() throws {
    // ...
}

//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    buyGroceries(ingredients)
//}

//: Assertions
// An assertion is a runtime check that a Bool condition definitely evaluates to true.
// In some cases, it is simply not possible for your code to continue execution if a particluar condition is not satisfied. In these situations, you can trigger an assertion in your code to end code execution and to provide an opportunity to debug the cause of the absent or invalid value. 

//Debugging with Assertions

let age = -3
assert(age >= 0, "A person's age cannot be less than zero") //this causes the assertion to trigger, because age is not >= 0
