//
//  main.swift
//  Collection-Types
//
//  Created by Alexandre Cardoso on 24/01/21.
//

import Foundation

var colors = Set(["red", "green", "blue"])
var colors2 = Set(["red", "green", "blue", "red", "blue"])

//print("Set1: \(colors)")
//print("Set2: \(colors2)")


var arrayCores: [String] = ["Vermelho", "Amarelo", "Verde", "Vermelho", "Amarelo", "Verde"]
//print("Array: \(arrayCores)")

var setCores: Set<String> = Set(["Vermelho", "Amarelo", "Verde", "Vermelho", "Amarelo", "Verde"])
//print("Set: \(setCores)")

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
let result = favoriteGenres.contains("Rock")
//print("Resultado de Contains: \(result)")


let (inserido, valor) = setCores.insert("Verde")
//print("Foi inserido: \(inserido)")
//print("Valor: \(valor)")
//print("Inserindo valores: \(setCores)")


setCores = Set(arrayCores)
//print("Set recebendo array: \(setCores)")



//MARK: - Tuples

var name = (teste: "Taylor", vaila: "Swift")

print("Tuplas: \(name)")

name.teste = "Web"
name.vaila = "Mail"


print("Tuplas: \(name)")

var valore = name
print(valore)





