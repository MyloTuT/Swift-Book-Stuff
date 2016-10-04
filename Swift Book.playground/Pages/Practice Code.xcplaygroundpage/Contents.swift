//: Practice

import Foundation

let digits = 20000
var sum = 0

for i in 0..<digits {
    sum += i;
}

var str = "ab c"
var out = ""
for c in str.characters {
    if c == " " {
        out.append("%20")
    } else {
        out.append(c)
    }
}

print(out);

for letter in "letters".characters {
    print(letter)
}

var string1 = "hello"
var string2 = "Myles"
var welcome = string1 + string2
print(welcome)

var kind = "How are you"
welcome += kind

let questionMark:Character = "?"
let period:Character = "."

string2.append(period)
kind.append(questionMark)

welcome += kind

string1.characters.count
welcome.characters.count

for char in string1.characters {
    print(char)
}

string1[string1.startIndex]
string1[string1.index(before:string1.endIndex)]

var value = string1.characters.count

string1.uppercased()

var s = "a"

func isUnique(input: String)->Bool{
    var mySet = Set<Character>()
    for cur in input.characters {
        if(mySet.contains(cur)){
            return false;
        }
        mySet.insert(cur)
    }
    return true;
}
isUnique(input: "AB")

func getNth(input: String, idx: Int)->String {
    for cur in input.characters.indices {
        if (input.characters.distance(from: input.startIndex, to: cur) == idx){
            return String(input[cur])
        }
    }
    return ""
}
getNth(input: "ABC", idx: 2)

//palandrome problem
//camelCase

//Write a method to replace all spaces in a string with ‘%20’.
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

var num = 0
var moveIt = string1.index(string1.startIndex, offsetBy:num)
string1[moveIt]

func newOne(a: Int) ->Bool {
    return true
}

func willFunc(zzzz: (Bool) -> Bool) -> Bool {
    return zzzz(true)
}
willFunc(zzzz: { (bool1:Bool) -> Bool in return bool1 } ) ? print(true) : print(false)

func carPool(seat2: String) -> (_ seat1: String) -> String{
    func passengerSeat(seat1: String) -> String {
        return seat1 + seat2
    }
    return passengerSeat
}
carPool(seat2:  "ASDASD")("---okokok")