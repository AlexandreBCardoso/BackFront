//
//  main.swift
//  Ex001-Biblioteca
//
//  Created by Alexandre Cardoso on 26/01/21.
//

import Foundation


// MARK: - Exercício 01
/*
1. Crie um diagrama de classes que modele um objeto Livro.
Lembre-se de que ele NÃO representa uma cópia específica de um livro, mas da obra de forma abstrata.
Como regra geral, um livro deve ter nome (String), um código ISBN (Int) e um autor (String).
a. Implemente a classe criando os atributos e construtores que forem necessários.
b. No Playground, crie três objetos Livro.
*/
class Livro {
	var nome: String
	var codISBN: Int
	var autor: String
	
	private var exemplar = [ExemplarBiblioteca]()
	
	init(nome: String, codISBN: Int, autor: String) {
		self.nome = nome
		self.codISBN = codISBN
		self.autor = autor
	}
	
	func adicionaExemplar(livro: ExemplarBiblioteca) {
		self.exemplar.append(livro)
	}
	
	func listaExemplar() -> [ExemplarBiblioteca] {
		return self.exemplar
	}
	
}

let mindSet = Livro(nome: "MindSet", codISBN: 2017, autor: "Carol S. Dweck")
let cleanCode = Livro(nome: "Clean Code", codISBN: 2009, autor: "Robert Martin")
let designDDD = Livro(nome: "Domain-Driven Design", codISBN: 2016, autor: "Eric Evans")


// MARK: - Exercício 02
/*
2. Crie um diagrama de classe que represente um modelo de sócio de uma biblioteca.
Como regra geral, um sócio deve ter um nome (String), um sobrenome (String) e um número de identificação (Int).
a. Implemente a classe criando os atributos e construtores que forem necessários.
b. No Playground, crie três objetos Sócio.
*/
class Socio {
	var nome: String
	var sobrenome: String
	var identificacao: Int
	
	var nomeCompleto: String {
		return nome + " " + sobrenome
	}
	
	init(nome: String, sobrenome: String, identificacao: Int) {
		self.nome = nome
		self.sobrenome = sobrenome
		self.identificacao = identificacao
	}
}

let caio 		= Socio(nome: "Caio", sobrenome: "Fabrini", identificacao: 01)
let felipe	= Socio(nome: "Felipe", sobrenome: "Miranda", identificacao: 02)
let tonon 	= Socio(nome: "André", sobrenome: "Tonon", identificacao: 03)


// MARK: - Exercício 03
/*
		3. Queremos adicionar ao modelo anterior uma nova categoria de sócios: os sócios VIP.
			 Além de um nome, um sobrenome e um número de identificação, estes sócios têm um valor de mensalidade (Int).
			 a. Como você modificaria o diagrama de sócio criado anteriormente?
			 b. Modifique a implementação considerando os novos requisitos. Crie as classes que forem necessárias.
			 c. Crie os atributos necessários.
			 d. No Playground, crie dois objetos SócioVIP.
*/
class SocioVIP: Socio {
	var mensalidade: Int
	
	init(nome: String, sobrenome: String, identificacao: Int, mensalidade: Int) {
		self.mensalidade = mensalidade
		super.init(nome: nome, sobrenome: sobrenome, identificacao: identificacao)
	}
	
}
let lucas 	= SocioVIP(nome: "Lucas", sobrenome: "Munho", identificacao: 04, mensalidade: 344)
let danilo 	= SocioVIP(nome: "Danilo", sobrenome: "Uvara", identificacao: 05, mensalidade: 45)


// MARK: - Exercício 04
/*
		4. Crie um diagrama de classes com um modelo de exemplar da biblioteca.
			 Lembre-se de que um exemplar representa uma cópia e uma edição particulares de um livro específico.
			 Como regra geral, um exemplar deve ter um Livro (Livro), um número de edição
			 (Int), uma localização (String) e um número de identificação (Int).
			 a. Implemente a classe criando os atributos necessários.
*/
class ExemplarBiblioteca: Livro {
	var numEdicao: Int
	var localizacao: String
	var numIdentificacao: Int
	
	init(nome: String, codISBN: Int, autor: String, numEdicao: Int, localizacao: String, numIdentificacao: Int) {
		self.numEdicao = numEdicao
		self.localizacao = localizacao
		self.numIdentificacao = numIdentificacao
		super.init(nome: nome, codISBN: codISBN, autor: autor)
	}
	
}

let mindSetExemplar01 = ExemplarBiblioteca(nome: mindSet.nome, codISBN: mindSet.codISBN, autor: mindSet.autor, numEdicao: 1, localizacao: "Rua Norte", numIdentificacao: 001)
let mindSetExemplar02 = ExemplarBiblioteca(nome: mindSet.nome, codISBN: mindSet.codISBN, autor: mindSet.autor, numEdicao: 1, localizacao: "Rua Norte", numIdentificacao: 002)
let mindSetExemplar03 = ExemplarBiblioteca(nome: mindSet.nome, codISBN: mindSet.codISBN, autor: mindSet.autor, numEdicao: 1, localizacao: "Rua Norte", numIdentificacao: 003)
let mindSetExemplar04 = ExemplarBiblioteca(nome: mindSet.nome, codISBN: mindSet.codISBN, autor: mindSet.autor, numEdicao: 1, localizacao: "Rua Norte", numIdentificacao: 003)


let cleanCodeExemplar001 = ExemplarBiblioteca(nome: cleanCode.nome, codISBN: cleanCode.codISBN, autor: cleanCode.autor, numEdicao: 5, localizacao: "Rua Lest", numIdentificacao: 001)
let cleanCodeExemplar002 = ExemplarBiblioteca(nome: cleanCode.nome, codISBN: cleanCode.codISBN, autor: cleanCode.autor, numEdicao: 5, localizacao: "Rua Lest", numIdentificacao: 002)
let cleanCodeExemplar003 = ExemplarBiblioteca(nome: cleanCode.nome, codISBN: cleanCode.codISBN, autor: cleanCode.autor, numEdicao: 5, localizacao: "Rua Lest", numIdentificacao: 003)

let designDDDExemplar001 = ExemplarBiblioteca(nome: designDDD.nome, codISBN: designDDD.codISBN, autor: designDDD.autor, numEdicao: 5, localizacao: "Rua Oeste", numIdentificacao: 001)
let designDDDExemplar002 = ExemplarBiblioteca(nome: designDDD.nome, codISBN: designDDD.codISBN, autor: designDDD.autor, numEdicao: 5, localizacao: "Rua Oeste", numIdentificacao: 002)
let designDDDExemplar003 = ExemplarBiblioteca(nome: designDDD.nome, codISBN: designDDD.codISBN, autor: designDDD.autor, numEdicao: 5, localizacao: "Rua Oeste", numIdentificacao: 003)


// MARK: - Exercício 05
/*
		5. Além de ter nome, código ISBN e autor, o livro de uma biblioteca possui uma
			 lista de exemplares ([Exemplar]) disponíveis para empréstimo.
*/
mindSet.adicionaExemplar(livro: mindSetExemplar01)
mindSet.adicionaExemplar(livro: mindSetExemplar02)
mindSet.adicionaExemplar(livro: mindSetExemplar03)
let listaMindSet = mindSet.listaExemplar()

if listaMindSet.count >= 1 {
	for livro in listaMindSet {
		print("Livro: \(livro.nome)")
		print("Localização: \(livro.localizacao)")
		print("Identificação: \(livro.numIdentificacao)")
		print("===============================================")
	}
}

cleanCode.adicionaExemplar(livro: cleanCodeExemplar001)
cleanCode.adicionaExemplar(livro: cleanCodeExemplar002)
cleanCode.adicionaExemplar(livro: cleanCodeExemplar003)
let listaCleanCode = cleanCode.listaExemplar()

if listaCleanCode.count >= 1 {
	for livro in listaCleanCode {
		print("Livro: \(livro.nome)")
		print("Localização: \(livro.localizacao)")
		print("Identificação: \(livro.numIdentificacao)")
		print("===============================================")
	}
}

designDDD.adicionaExemplar(livro: designDDDExemplar001)
designDDD.adicionaExemplar(livro: designDDDExemplar002)
designDDD.adicionaExemplar(livro: designDDDExemplar003)
let listaDesign = designDDD.listaExemplar()

if listaDesign.count >= 1 {
	for livro in listaDesign {
		print("Livro: \(livro.nome)")
		print("Localização: \(livro.localizacao)")
		print("Identificação: \(livro.numIdentificacao)")
		print("===============================================")
	}
}


mindSet.nome = "teste nome"
print("Livro: \(mindSet.nome)")
print("Exemplar: \(mindSetExemplar01.nome)")
print("Array Livro Exemplar: \(mindSet.listaExemplar()[0].nome)")
