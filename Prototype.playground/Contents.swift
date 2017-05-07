protocol Copying {
    init(instance: Self)
}

extension Copying {
    func copy() -> Self {
        return Self.init(instance: self)
    }
}

class Person: Copying {
    var name: String!
    var surname: String!
    
    init() {}
    
    required init(instance: Person) {
        self.name = instance.name
        self.surname = instance.surname
    }
}

let firstPerson = Person()
firstPerson.name = "Yura"
firstPerson.surname = "Petrov"

let secondPerson = firstPerson.copy()
print("First Person name: \(firstPerson.name!)")
print("First Peson surname: \(firstPerson.surname!)")
print("")
secondPerson.name = "Roma"

print("Second Person name: \(secondPerson.name!)")
print("Second Peson surname: \(secondPerson.surname!)")
print("")

print("First Person name: \(firstPerson.name!)")
print("First Peson surname: \(firstPerson.surname!)")