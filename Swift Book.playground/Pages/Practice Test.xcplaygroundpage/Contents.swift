/*
//: Myles Practice Test

 //: *ENUMERATION
Write a function that takes an Enumeration of Planets and uses conditional statements to return the Integer order of the planet
The planets are Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepture
example
planetOrder(Planets: Earth)
3
Returns 3 since Earth is the third planet
-----
 
//: *BASIC OPERATORS
 1) Write a function that takes an integer and returns the remainder of 3 example:
Input
Integer: 4
Output
1
 
2) Write a function that takes two integers, a numerator and a denominator and returns the remainder of the denominator
Input
Integer: 5
Integer: 7
Output
5
 
3) Write a function that takes a string and returns the reverse of the string
Input
String: "hello"
Output
"olleh"
 
4) Write a function that takes a Character and a Dictionary as input and returns the sum of the values whose keys end with the input character
Input
Character: "e"
Dictionary: {"apple" : 1, "grape" : 3, "banana" : 4}
Output
4
 
5) Write a function that takes two Strings and returns a concatenated copy of the reversed strings
Input
String: "cat"
String: "dog"
Output
"tacgod"
 
6)  Write a function that takes two Strings with float values and returns the product of those values as a string
Input
String: "4.0"
String: "0.5"
Output
"2.0"
 
7) Write a funcation that takes a Character and a String and returns the number of time the input character appears in the string
Input
Character: "a"
String: "banana"
Output
3

//: *COLLECTION TYPES
1) Write a function that takes an array of Strings and returns a Dictionary with the number of times each String appears in the array
Input
[String]: {"cat", "dog", "cat", "apple", "banana", "apple", "cat"}
Output
    {"cat":3, "dog":1, "apple":2, "banana":1}
 
2) Write a function that takes an array and a string and deletes every occurence of the input string from the array
Input
[String]: {"abc", "cat", "dog", "abc", "fish", "abc", "rabbit"}
String: "abc"
Output
{"cat", "dog", "fish", "rabbit"}
 
//: *CONTROL FLOW
1) Write a function that when given a value from 0-9 returns "ones", if given a value from 10-99 returns "tens" and if given a value from 100-999 returns "hundreds"
Input
Integer: 546
Output
"hundreds"
 
2) Write a function that takes an (Int, Int) Tuple (x, y) and returns true if the if the x is divisible by 2 or the y is divisible by 7
Input (example 1)
(Int, Int): (12, 20)
Output
true
Input (example 2)
(Int, Int): (13, 21)
Output
true
Input (example 3)
(Int, Int): (13, 10)
Output
false
 
3) Write a function that takes a (String, String) Tuple (x, y) and a Closure that will either return the concatenated tuple, return the tuples separated by a hyphen or return the tuples concatenated in reverse order
Input (example 1)
(String, String): ("good", "morning")
Closure: concatenate
Output
"goodmorning"
Input (example 2)
(String, String): ("good", "morning")
Closure: hyphenated
Output
"good-morning"
Input (example 3)
(String, String): ("good", "morning")
Closure: reversed
Output
"morninggood"

//: *IOS Questions
1) What is the delegate pattern?
2) What is a unit test?
3) What is a view controller?
4) In the app lifecycle what is the main run loop?
5) What are the execution states for apps?
 
    GIT Questions
1) How do you create a branch?
2) How do you push changes to a branch
3) How do you switch from a branch back to master
4) How do you preview the changes to a file or branch before you merge
5) How do you replace the local changes to a file with the last contents on head

 //: *AUTOLAYOUT
1) what is the auto layout?
2) What is the aligntool?
3) What is the pin tool?
4) How do you pin to one or more edges?
5) How do you make it so a menu is always accessible from the top right corner of its paren view?
6) How do you make it so a view is resized (width and height) to match its parent views dimensions?
7) How do you center a view within its parent view?
 
//: *DEPENDENCY INJECTION
1) What is dependency injection?
2) What are some of the advantages of dependency injection?
3) How could you change the following to allow dependency injection of the RealService
protocol Service {}
class RealService: Service {}
class Client {
    let service: Service
    init() {
        service = RealService()
    }
}

 */
