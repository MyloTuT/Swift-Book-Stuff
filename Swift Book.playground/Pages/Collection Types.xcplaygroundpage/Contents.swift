//: ## Collection Types
//: *Swift provides three primary collection types, known as arrays, sets, and dictionaries fro storing collections of values.
//: ** Arrays are ordered collections of values
//: ** Sets are unordered collections of unique values
//: ** Dictionaries are unordered collections of key-value associations

//: *Mutability of Collections
// If you create an array, set, or dictionary and assign it to a variable, the collection that is created will be mutable. This means that you can change the collection after it is created by adding, removing, or changing items in teh collection. If you assign an array, a set, or dictionary to a constant, that collection is immutable.

//: *Arrays
// An array stores values of the same type in an ordered list. 

//: ** Array Type Shorthand Syntax
// The type of a Swift array is written in full as Array<Element>, where Element is the type of values the array is allowed to store. You can also write the type of an array in shorthad form as [Element] which is preferred when referencing the type of array. 
//: **Create an Empty Array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3) //someInts now contains 1 value of type Int
someInts = [] //someInts is now an empty array, but is still of type [Int]

//: **Creating an Array with a Default Value
//Swift's Array type also provides an initializer for creating an array of a certain size with all of it's values set to the same default value. You pass this initializer a default value of the appropriate type (called repeating): and the number of times that value is repeated in the new array (called count):

var threeDoubles = Array(repeating: 1.1, count: 3) //threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

//: **Creating an Array by Adding Two Arrays Together
// You can create a new array by adding together two existing arrays with compatible types with the addition operator(+) The new array's type is inferred from the type of the two arrays you add together.

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//: Creating an Array with an Array Literal
// you can also initilize an array with an array literal. Which is a shorthand way to write one or more values as an array collection. An array literal is written as a list of values, separated by commas, surrounded by a pair of square brackets:
var shoppingList: [String] = ["Eggs", "Milk"]

//: **Accessing and Modifying an Array
// You access & modify an array through its methods and properties, or by using subscript syntax

// To find out the number of items in an array, check its read-only "count" property:
print("The shopping list contains \(shoppingList.count) items")

//Use the Bool "isEmpty" property as a shortcut for checking whether the count property is equal to 0: 
if shoppingList.isEmpty {
    print("the shopping list is empty")
} else {
    print("The shopping list is not empty")
}

//You can add a new item to the end of an array by calling the array's "append(_:)" method:
shoppingList.append("Flour")
//Alertnatively, append an array of one of more compatible items with the addition assignment operator (+=)
shoppingList += ["Baking Powder"]
shoppingList += ["Chocoloate Spread", "Cheese", "Butter"]

//Retrieve a value from the array by using subscript syntax, passing the index of the value you want to retrieve within square brackets immediately after the name of the array:
var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

//You can use subscript syntax to change the range of values at once
shoppingList[4...6] = ["Bananas", "Apples"]

//To insert an item into the array at a specified index, call the array's "insert(_at:)" method
shoppingList.insert("Maple Syrup", at: 0)

//You remove an item from the array with the remove(_at:) method
let mapleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]

//If you want to remove the final item from an array, use the removeLast() method rather than the remove(at:) method to avoid the need to query the array's "count" property. 

let apples = shoppingList.removeLast()

//: **Iterating Over an Array
//you can interate over the entire set of values in an array with the for-in loop

for item in shoppingList {
    print(item)
}

//If you need the integer index of each item as well as its value, use the enumerated() method to interate over the array instead. For Each item in the array, the "enumerated() method returns a tuple composed of an integer and the item. 

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//: Sets
// A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once. 

//: **Hash Values for Set Types
// A type must be hashable in order to be stored in a set-that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, it follows that a.hashValue == b.hashValue
// All of Swift's basic types(such as String, Int, Double, and Bool) are hashable by default, and can be used as a set value types or dictionary key types.

//: * Set Type Syntax
// The type of a Swift set is written as "Set<Element>", where "Element" is the type that the set is allowed to store. Unlike arrays, sets do not have an equivalent shorthand form.

//: **Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//Alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty set with an empty array literal:
letters.insert("a") //letters now contains 1 value of type Character
letters = [] //letters is now an empty set, but is still of type Set<Character>

//: *Creating a Set with an Array Literal
// You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set collection
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip-Hop"] //favoriteGenres has been initialized with three initial items
var favoriteGenres2:Set = ["Rock", "Classical", "Hip-Hop"] // this is the shorthand of favoriteGenres

//: * Accessing and Modifying a Set

//To find out the number of items in a set, use the count property
print("I have \(favoriteGenres.count) favorite music genres")


//Use the Bool isEmpty property as a shortcut for checking whether the count property is equal to 0:
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences")
}

//You can add a new item into a set by calling the set's "insert(:) method:
favoriteGenres.insert("Jazz")

//You can remove an item from a set by calling the set's "removal(:) method which removes the item if it's a memeber of the set, and returns the removed value, or returns nil. Alternatively, all items in a set can be removed with its removeAll() method

if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

//To check whether a set contains a particular item, use the contains(:) method
if favoriteGenres.contains("Funk") {
    print(" I get up on the good foot.")
} else {
    print("It's to funky in here")
}

//: *Iterating Over a Set
// You can interate over the values in a set with a for-in loop

for genre in favoriteGenres {
    print("\(genre)")
}

//Swift "Set" type does not have a defined ordering. To interate over the values of a set in a specific order use the sorted() method, which returns the set's elements as an array sorted using the < operator
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//: Performing Set Operations
//You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determing whether two sets contain all, some, or none of the same values

//: *Fundamental Set Operations
//: ** Use the "intersection(:) method to create a new set with only the values common to both sets
//: ** Use the "symmetricDifference(:)" method to create a new set with values in either set, but not both
//: ** Use the "union(:) method to create a new set with all of the values in both sets
//: ** Use the "subtracting(:)" method to create a new set with values not in the specified set

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

//: **Set Membership and Equality
// **Use the "is equal" operator (==) to determine whether two sets contain all of the same values.
// **Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set
// **Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set
// **Use the isStrictSubset(of:) or is StrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set
// **Use the isdisjoint(with:) method to determine whether two sets have any values in common

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑","🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

//: Dictionaries
// A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real world dictionary is used to look up the definition for a particular word. 

//: *Dictionary Type Shorthad Syntax
//The type of a Swift dictionary is written in full as "Dictionary<Key>, Value>", where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys. A dictionary Key type must conform to the Hashable protocol, like a set's value type. 
//You can also write the type of a dictionary in shorthand form as [Key: Value]. Although the two forms are functionality identical, the shorthad form is preferred. 

//: **Creating an Empty Dictionary
var namesOfIntegers = [Int: String]() //namesOfIntegers is an empty [Int: String] dictionary

// If the context already provides type informatio, you can create an empty dictionary with an empty dictionary literal, which is written as [:] (a colon inside a pair of square brackets):
namesOfIntegers[16] = "sixteen" //namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:] //namesOfIntegers is now an empty dictionary

//: ** Creating a Dictionary with a Dictionary Literal
// You can also initialize a dictionary with a "dictionary literal" which has a similar syntax to the array literal seen earlier. 
// A "Key-Value Pair is a combination of a key and a value. In a dictionary literal, the key and value in each key-value are separated by a colon. The key-value pairs are written as a list, separated by commas, surrounded by a pair of square brackets:
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] //var name: [Key Type: Value Type] = [Key: Value]
var airports1 = ["JFK": "John F. Kennedy", "LGA": "Laguardia"]

// * Accessing & Modifying a Dictionary
// You access a dictionary through it's methods and properties, or by using subscript syntax

print("The airports dictionary contains \(airports.count) items")

// Use Bool isEmpty property as a shortcut for checking whether the count property is equal to 0:

if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}

airports["LHR"] = "London Heathrow"
airports.count

// As an alternative to subscripting, use a dictionary's "updateValue(:forKey:)" method to set or update the value for a particular key. 
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil //APL has now been removed from the dictionary

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB")
}
//: **Iterating over a Dictionary
// You can iterate over the key-value pairs in a dictionary with the for-in loop. Each item in the dictionary is returned as a (key, value) tuple, and you can decompose the tuple's memebers into a temporary constants or variables as part of the iteration:

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//You can retrieve an interable collection of a dictionary's keys or values properties:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// If you need to use a keys or values with an API that takes an Array instance, initialize a new array with the keys and values property

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)