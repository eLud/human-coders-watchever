//: Playground - noun: a place where people can play

import Foundation

class Calanque {
    
    // Permet de créer un alias d'un type existant
    typealias Position = (lat: Double, long: Double)
    
    var nom: String = ""
    let position: Position = (lat: 0.0, long: 0.0)
    
    // Position... permet de définir des "variadic parameter" (de 0 à n)
    // A ne pas faire
    
    ///Calcule un itinéraire
    @discardableResult //Pour dire que le retour n'est pas important
    func itinéraire(depuis origine: Position,_ heure: Int = 12, 👨‍👨‍👧‍👧👨‍👨‍👧‍👧 nbPersonne: Int = 0, étapes: Position...) -> (étapes: [Position], durée: Int) {
        print(origine)
        print(heure)
        print(nbPersonne, terminator: "\n")
        
        for _ in étapes {
            
        }
        
        return ([origine] + étapes + [position], 6)
    }
}

let c = Calanque()
let c2 = c
c.nom = "Morgiou"

c.itinéraire(depuis: (0.0, 0.0), 4)
c.itinéraire(depuis: (0,0), 5, étapes: (1,1), (2,2))
c.itinéraire(depuis: (0,0), 7, étapes: (1,1))
let iti = c.itinéraire(depuis: (0,0), 5, 👨‍👨‍👧‍👧👨‍👨‍👧‍👧: 7, étapes: (2,2))

iti.durée
iti.étapes

struct Bateau {
    
    enum Catégorie {
        case voilier
        case chalutier
        case pointu
        case pirogue
    }
    
    var nom: String = "Oh"
    let type: Catégorie = Catégorie.pointu
}



c2.nom

var b = Bateau()
let b2 = b
b.nom = "Toto"
b.nom

b2.nom

func removeValue(forKey: String) {
    
}

removeValue(forKey: "")

func insert(_ object: Any, at index: Int) {
    
}

insert("Toto", at: 0)


let dico = ["France": 6576895, "Italie": 87565]

let pop: Optional<Int> = dico[";jcd"]
if pop != nil {
    pop!*2
}

//Si j'ai pas l'optional je peux continuer
if let popul = dico[";jcd"] {
    popul*2
} else {
    print("Mauvaise clé")
}

// J'ai obligatoirement besoin de la valeur
guard let population = dico["France"] else { fatalError("This should never happen") }
population*2

// nil coalescing operator : permet de mettre une valeur par défaut si nil
let population2 = dico["France"] ?? 42

// Raw value (Int/Double/Float/String/Character)
enum FlightStatus: String {
    case onTime = "ontime"
    case delayed
    case cancelled
    case unknown
    
    static var allCases: [FlightStatus] {
        return [FlightStatus.onTime]
    }
    
    var name: String {
        switch self {
        case .cancelled:
            return "Annulé"
        default:
            return self.rawValue
        }
    }
}

guard let status = FlightStatus(rawValue: "ontime") else { fatalError("") }
status

// Associated value (n'importe quel type)
enum FlightStatus2<T> {
    case onTime
    case delayed (delay: T)
    case cancelled
    case unknown
}

let status2: FlightStatus2<Int> = FlightStatus2.delayed(delay: 5)


enum Optionel<Wrapped> {
    case none
    case some(Wrapped)
    
    func unwrapped() -> Wrapped {
        switch self {
        case .none:
            fatalError("Unexpectly found nil while unwrapping")
        case .some (let object):
            return object
        }
    }
}

var opt = Optionel.some("Hello")
opt.unwrapped()

func returnFirst<T>(nb: T...) -> T? {
    return nb.first
}

returnFirst(nb: "Toto", "Titi")

// Struct générique, dont les éléments doivent être Equatable
struct Stack<Element: Equatable> {
    
    private var tab: [Element] = []
    
    mutating func push(_ elemnt:Element) {
        tab.append(elemnt)
        
        elemnt == elemnt
    }
    
    mutating func pop() -> Element? {
        return tab.popLast()
    }
    
}


let stackSTring: Stack<Int> = Stack()


class Human {
    
    var age: Int
    let name: String
    var size: Float
    var gender: String
    var childrens: [Human]?
    
    convenience init() {
        
        self.init(name: "John Doe", age: 0, size: 175, gender: "Male")
    }
    
    init(name: String, age: Int, size: Float, gender: String) {
        
        self.name = name
        self.age = age
        self.size = size
        self.gender = gender
    }
}

class Student: Human {
    
    var school: String
    var serious: Bool
    var grade: Int
    
    init(name: String, age: Int, size: Float, gender: String, school: String, isSerious: Bool, grade: Int) {
        
        self.school = school
        self.serious = isSerious
        self.grade = grade
        
        super.init(name: name, age: age, size: size, gender: gender)
    }
    
    convenience init() {
        
        self.init(name: "Student Jane Doe", age: 18, size: 180, gender: "Female", school: "Not enrolled", isSerious: true, grade: 10)
    }
    
    convenience override init(name: String, age: Int, size: Float, gender: String) {
        
        self.init(name: name, age: age, size: size, gender: gender, school: "Not enrolled", isSerious: true, grade: 10)
    }
}
