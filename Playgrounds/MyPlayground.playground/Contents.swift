//: Playground - noun: a place where people can play

import UIKit

var str: String
str = "Hello"
str = " World"

// Typage fort, pas de cast implicite
var a = 5.0
var b: Float = 2.0
var c = Float(a) / b

// let est une constante
let str2 = "Toto"
//str2 = "Hello"

let isSwiftAwesome: Bool = Bool(0)

//: String

let concat = str + str2
let insert = "La valeur de a est \(a)"

let str3 = "Test" + "kjghjg \("toto")"
str3.characters

let 🤓 = "🤓 🤓".characters.count
 print(🤓)

//: Collections

var villes = ["Paris","Bordeaux","Lyon","Marseille"]
let result = villes[0]

//var villes: Array<String> = ["Paris","Bordeaux","Lyon","Marseille"]

var tabVide: [[Int]] = []
tabVide.append([0,1])
//tabVide.append("Toto")

var tabVide2 = Array<Int>()
var tabVide3 = [Int]()

//Range point départ -> Point arrivée
// [x...y] de x à y inlus
// [x..<y] de x à y exclus
let slice = villes[1...3]
print(slice)

villes[2...3] = ["SF", "NY", "Toto"]

var nbHabitants = ["Paris":2_250_000, "Bordeaux" : 239_000, "Lyon" : 491_268, "Marseille" : 850_636]
nbHabitants["Marseille"] = 850_637
nbHabitants.removeValue(forKey: "Marseille")
nbHabitants["Marseille"] = nil

let dicoVide: [AnyHashable:Int] = [:]
let dicoVide2 = Dictionary<String, Int>()

for (clé, valeur) in nbHabitants {
    
    print(valeur)
}

for var i in 0...100 {
    print(i)
}
