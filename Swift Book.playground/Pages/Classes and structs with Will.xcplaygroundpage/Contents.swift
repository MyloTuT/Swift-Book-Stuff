// you would only use a class to isolate behavior and pass messages. Can talk to each other through messages. 
// a class can stay around and persist. 

class MylesMath {
    
    func mult(x: Int, y: Int) -> Int {
        return x * y
    }
    
    
}
let mm = MylesMath()
mm.mult(x: 2, y: 4)

struct Promo {
    var basePromo = 20
    var optionalPromo = 0
    
    init(optionalPromo: Int) {
        self.optionalPromo = optionalPromo
    }

    func offerText() -> String {
        var promo = 0
        if self.basePromo > self.optionalPromo {
            promo = self.basePromo
        } else {
            promo = self.optionalPromo
        }
        return "Unlimited Only" + " " + String(promo) + "$$$$$$$$"
        
    }
}

let newPromo = Promo(optionalPromo: 10)
newPromo.basePromo
newPromo.optionalPromo
newPromo.offerText()

class Car {
    var brand = String()
    
    func maxMPH() -> Int {
        
        var mph = 0
        if self.brand == "Mercedes" {
            mph = 150
        }
        return mph
    }
}

let mercedes = Car()
mercedes.brand = "Mercedes"
mercedes.maxMPH()

class Elevator {
    var speed = String()
}

class Building {
    var elevators = Elevator()
}

let elevator = Elevator()
elevator.speed = "super fast"

let hudson = Building()
hudson.elevators = elevator

hudson.elevators.speed  

