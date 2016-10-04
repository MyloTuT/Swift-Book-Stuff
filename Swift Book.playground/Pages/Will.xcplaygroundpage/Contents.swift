//: Closures & Enumeration Practice

func newPerson(name: String) -> ((String, Int) -> String){
    func hola(middleName: String, age: Int) -> String {
        return name + middleName + String(age)
    }
    return hola
}

var him = newPerson(name: "Myles")
him("Ross", 3)
him("Lewis", 31)

enum Salutation {
    case spanish, english, german, italian
}


func sayHello(hello: Salutation) -> ((String) -> String) {
    
    let salutation = { () -> String in
        
        switch hello {
        case .spanish:
            return "Hola"
        case .english:
            return "Hi"
        case .german:
            return "Guten Morgen"
        default:
            return "Hello"
        }
    }()
    
    func speak(name: String) -> String {
        return  salutation + " " + name
    }
    return speak
}

var spanishHello = sayHello(hello: Salutation.spanish)
spanishHello("Myles")
spanishHello("Will")


var germanHello = sayHello(hello: Salutation.german)
germanHello("Will")
germanHello("Myles")

func myReverse(s: String) -> String {
    var out = ""
    for char in s.characters {
        
    }
    return out
}
myReverse(s: "Hello")