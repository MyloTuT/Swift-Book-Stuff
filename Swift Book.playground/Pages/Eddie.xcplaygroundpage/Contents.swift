//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
func myReverse(s: String)->String {
    var out = ""
    for idx in s.characters.indices.reversed() {
        out.append(s[idx])
    }
    return out
}

myReverse(s: "hello")

func reverse2(s: String)->String{
    var out = ""
    for char in s.characters.reversed(){
        out.append(char)
    }
    return out
}

reverse2(s: "hello")

func myRev(s:String)->String{
    var out = ""
    let x = s.characters.indices.reversed()
    
    for letters in x {
        out.append(s[letters])
    }
    return out
}

func test(x:String)->String{
    var out = ""
    let t = x.characters.indices.reversed()
    
    for letters in t {
        out.append(x[letters])
    }
    return out
    
}

test(x: "hello")
