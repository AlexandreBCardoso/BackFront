import UIKit

/*
			COLLECTION - ARRAY
*/

// 1. Criação de Array vazio
var arrayTeste1 = [Int]()
var arrayTeste2: [Int] = []


// 1.1 Criação de Array com valor Default
var nomes = Array(repeating: "nome", count: 2)
var sobrenomes = Array(repeating: "sobrenome", count: 3)
var nomeCompleto = nomes + sobrenomes


// 2. Inserindo valor em um Array
nomes = ["Alexandre"]
nomes += ["Caio"]
nomes.append("Pedro")
nomes[2] = "Felipe"
nomes.insert("Junior", at: nomes.count)
nomes.insert(contentsOf: sobrenomes, at: nomes.count)
nomes[1...2] = ["Ana", "maria"]
print(nomes)

// 3. Removendo valor em um Array
//nomes.remove(at: 0)
//nomes.removeFirst()
//nomes.removeLast()
//print(nomes)


// 4. Percorrendo um Array
for nome in nomes {
	print("Nome: \(nome)")
}

for (indice, valor) in nomes.enumerated() {
	print("Indice \(indice), valor \(valor)")
}


// 5. Manipulação
nomes.reverse()
nomes.min()
nomes.max()
nomes.shuffle()


/*
			COLLECTION - DICTIONARY
*/



// Collection - Dicionarios
var dicionario = ["Casa": 1, "Apartamento": 2, "Outros": 3]


//print(dicionario.keys)
//print(dicionario.values)

var dicionario3: [Int:String] = [1: "Um", 2: "Dois", 3: "Tres"]




var dicKey = [Int](dicionario3.keys)
var dicValue = [String](dicionario3.values)

//print("DictKey: \(dicKey)")
//print("DictValue: \(dicValue)")
//
//for valor in dicionario3 {
//	print("Index: \(valor.key)")
//	print("Item: \(valor.value)")
//}
