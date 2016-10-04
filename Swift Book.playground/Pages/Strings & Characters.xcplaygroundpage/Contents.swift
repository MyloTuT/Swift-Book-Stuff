//: ## Strings & Characters
// A string is a series of characaters

//: String Literals
let someString = "Some string literal value"

//: Initializing an empty string
var emptyString = "" //empty string literal
var anotherEmptyString = String() //These two strings are equivalent to each other

//: * find out if the string is empty
if emptyString.isEmpty {
print("Nothing to see here")
}

//: String Mutability
//: * You determine whether or not a string can be modified (with a var) or never change (with a constant(let))

var variableString = "Horse"
variableString += " and carriage" //variable string becomes horse and carriage

//: Strings Are Value Types
//: * Swifts strings are values

//:Working with characters
for character in "Dog🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"
let catCharacter: [Character] = ["C","a","t","s","!","🐱"]
let catString = String(catCharacter)
print(catString)

//: Concatenating Strings & Characters
//: * String values can be added together with the addition operator

let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2
var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

//:String Interpolation
let multiplier = 3
let message = "\(multiplier) time 2.5 is \(Double(multiplier) * 2.5)"

//: Unicode
//: * Unicode - the international standard for encoding, and processing text in different writing systems.

//: Counting Characters
//: * To retrive a count of characters use the "count" property of the strings "character" property

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

//: Accessing and Modifying a String
//: * You access and modify a string through it's methods & properties, or by using subscript syntax

//: String Indices
//: * Each string has an associated index type, "String.Index", which corresponds to the position of each Character in the string.
//: * startIndex property is used to access the position of the first character of a string
//: * endIndex property is the postion after the last character in a string. As a result, the endIndex isn't a valid argument to a string's subscript. If a string is empty, startIndex and endIndex are equal.
//: * You access the indices before and after a given index using the index(before:0 and index(after:) methods of "String. To access an index farther away from the given index, you can use the index(_:offsetBy:) method instead of calling one of these methods multiple times.

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
let numChoice = Int(-8)
let windex = greeting.index(greeting.endIndex, offsetBy:numChoice)
greeting[windex]

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}

//:Insert & Removing
//: * To insert a character into a string at a specified index,use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method

welcome = "Hello"
welcome.insert("!", at: welcome.endIndex) //welcome now becomes hello!
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))

// * To remove a single character from a stirng at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:

welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

//:Comparing Strings
//: * Swift provides three ways to compare textual values: string & character equality, prefix equality, and suffix equality

//:String and Character Equality
//: * this is checked with the "equal to" operator (==) and the "not equal to" operator(!=),
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

//: *Two "String" values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent.
let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two character are not equivalent")
}

//: Prefix and Suffix Equality
//: * to check whether a string has a particular stirng prefix or suffix, call the string's "hasPrefix(_:)" and "hasSuffix(_:)" methods, both of which take a single argument of type "String" and return a Bool value.
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A rom in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

//: * You can use the hasPrefix(_:) method with the romeoAndJuliet array to count the number of scenes in Act 1 of the play:
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount+=1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")

//: * similarly use the hassuffix(_:) method to count the number of scenes that take place in or around Capulet's mansion and Friar Lawrences cell:
var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount+=1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount+=1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

//: Unicode Representations of Strings
//: * when a unicode string is written to a text file or some other storage, the Unicode scalars in that string are encoded in one of several Unicode-defined encoding forms. Each form encodes the string in small chunks known as code units. These include the UTF-8 encoding from (which encodes a string as 8-bit code units), etc for 16 & 32 bit.

let dogString = "Dog!!🐶"

//:  UTF-8 Representation
//: * You can access a UTF-8 representation of a "String" by iterating over it's utf8 property. This property is of type "String.UTF8View, which is a collection of unsigned 8-bit (UInt8) values.

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
