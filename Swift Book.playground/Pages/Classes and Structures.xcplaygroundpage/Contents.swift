//: Classes and Structures
// Classes and structures are general-purpose, flexible constructs that become the building blocks of your program's code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, var, and functions.

//: *Comparing Classes & Structures
/* Both can:
    - Define properties to store values
    - Define methods to provide functionality
    - Define subscripts to provide access to their values using subscript syntax
    - Be extended to expand their functionality beyond a default implementation
    - Conform to protocols to provide standard functionality of a certain kind
*/

//: **Definition Syntax
// You introduce classes with the 'class' keyword.

class SomeClass {
    //class definition goes here
}


// You introduce structures with the struct keyword.

struct SomeStructure {
    // structure definition goes here
}

// Example of structure definition and class definition

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}



