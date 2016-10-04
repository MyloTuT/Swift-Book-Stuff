//: [Previous](@previous)

import Foundation

var ranNum = ""
var gottaGo = "Gotta Go"

for x in gottaGo.characters {
    if x == " " {
        ranNum.append("%20")
    }
    else {
        ranNum.append(x)
    }
}
print(ranNum);


//take a string and print it backwards.
//result = cba

var str = "abc"

func getStr(s:String)->String{
    var out = ""
    for x in s.characters.indices.reversed(){
        out.append(s[x])
    }
    return out
    
}
getStr(s: "today")


var testString = "Hi "

for x in testString.characters {
    if x == " " {
        testString.append(".")
    }
}
