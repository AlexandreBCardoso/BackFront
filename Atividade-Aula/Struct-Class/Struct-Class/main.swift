//
//  main.swift
//  Struct-Class
//
//  Created by Alexandre Cardoso on 25/01/21.
//

import Foundation


// MARK: - Struct

// Definição de Struct
struct Resolution {
	var width = 0
	var height = 0
}

// Instancia da Struct
var someResolution = Resolution()

// Acessando Propriedades
//print("O campo width de someResolution é: \(someResolution.width)")

// Atribuindo valor
someResolution.width = 1280
//print("O campo width de someResolution é: \(someResolution.width)")

// Memberwise Initializer
let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

//print("cinema is now: \(cinema.width) pixels wide")
//print("hd is still: \(hd.width) pixels wide")

// Propriedade Computada
struct Sport {
	var nome: String
	var isOlympicSport: Bool
	
	var olympicStatus: String {
		if isOlympicSport {
			return "\(nome) is an Olympic Sport"
		} else {
			return "\(nome) is not an Olympic Sport"
		}
	}
}

let chessBoxing = Sport(nome: "Chessboxing", isOlympicSport: false)
//print(chessBoxing.olympicStatus)

// Propriedade Observers
struct Progress {
	var task: String
	var isTeste: Bool
	var amount: Int {
		didSet {
			print("\(task) is now \(amount)% complete")
			if amount == 100 {
				isTeste = true
			}
		}
		willSet {
			print("\(task) era \(amount) e agora é \(newValue)")
		}
	}
}

var progress = Progress(task: "Loading data", isTeste: false, amount: 0)
//progress.amount = 30
//progress.amount = 80
//progress.amount = 100
//print(progress.isTeste)

// Mutating Method
struct Person {
	var name: String
	
	mutating func makeAnonymouns() {
		name = "Anonymouns"
	}
}

var person = Person(name: "Ed")
//person.makeAnonymouns()


// MARK: - Class

// Definição de Class
class VideoMode {
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0.0
	var name: String?
}

// Instancia da Class
var someVideoMode = VideoMode()

// Acessando Propriedades
//print("O campo width de someVideo é: \(someVideoMode.resolution.width)")
//print("O campo frameRate de someVideo é: \(someVideoMode.frameRate)")

// Atribuindo valor
someVideoMode.resolution.width = 2480
//print("O campo width de someResolution é: \(someVideoMode.resolution.width)")

// Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

//print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")


// MARK: - Enumeration

enum CompassPoint {
	case north, south, east, west
	mutating func turnNorth() {
		self = .north
	}
}

var currentDirection = CompassPoint.west
let rememberDirection = currentDirection
currentDirection.turnNorth()

//print("The current direction is \(currentDirection)")
//print("The remember direction is \(rememberDirection)")


// MARK: - Propriedade e método - String
let string = "Alexandre"
//print(string.count)
//print(string.hasPrefix("Do"))
//print(string.hasSuffix("or"))
//print(string.uppercased())
//print(string.sorted())
let arrayString = string.sorted()
for value in arrayString {
	print("Valor: \(value)")
}


// MARK: - Propriedade e método - Array
var toys = ["Woody"]


//print(toys.count)
//toys.append("Buzz")
//toys.firstIndex(of: "Buzz")
//print(toys.sorted())
//toys.remove(at: 0)

