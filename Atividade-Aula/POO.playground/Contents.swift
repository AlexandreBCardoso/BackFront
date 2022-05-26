import UIKit
import Foundation


class Pessoa {
	
	var nome: String = "Caio"
	var idade: Int = 25
	var peso: Double = 80.3
	var altura: Double = 1.76
	var sexo: String = "Masculino"
	
	func andar() {
		print("Anda muleque")
	}
	
}


//MARK: - Metodos Inicializadores

class Funcionarios {
	
	var nome: String?
	var idade: Int?
	var salario: Double?
	var cargo: String?
	var departamento: String?
	
	init(nome: String, idade: Int, salario: Double, cargo: String, departamento: String) {
		self.nome = nome
		self.idade = idade
		self.salario = salario
		self.cargo = cargo
		self.departamento = departamento
	}
	
	func dados() {
		print(self.nome ?? "")
		print(self.idade ?? 0)
		print(self.salario ?? 0)
		print(self.cargo ?? "")
		print(self.departamento ?? "")
	}
	
}


// MARK: - Desafio

// 1. Exercicio_01
class Empresa {
	
	var razaoSocial = "BackFront"
	var nomeFantasia = "Back"
	var cnpj = "123.134.134/0001-33"
	var qtdFuncionarios = 2
	var valor = 4.4
	
	func imprimir() {
		print(razaoSocial)
		print(nomeFantasia)
		print(cnpj)
		print(qtdFuncionarios)
		print(valor)
	}
	
}


class Aviao {
	
	var companhia = "LATAM"
	var modelo = "BOING"
	var assentos = 300
	var qtdAreomoca = 2
	
	func imprimir() {
		print(companhia)
		print(modelo)
		print(assentos)
		print(qtdAreomoca)
	}
	
}

var backFront: Empresa = Empresa()
//backFront.imprimir()

var latam: Aviao = Aviao()
//latam.imprimir()


// 2. Exercicio_02
class Dog {
	var nome: String = ""
	var raca: String = ""
	var idade: Int = 0
	
	init(nome: String, raca: String, idade: Int) {
		self.nome = nome
		self.raca = raca
		self.idade = idade
	}
	
	func imprimir() {
		print(self.nome)
		print(self.raca)
		print(self.idade)
	}
	
}

var cachorro: Dog = Dog(nome: "Toto", raca: "vira lata", idade: 3)
cachorro.imprimir()


class Notebook {
	var marca: String?
	var modelo: String?
	var valor: Double?
	
	init(marca: String) {
		self.marca = marca
		self.modelo = "LCD"
		self.valor = 0
	}
	
	init(marca: String, modelo: String, valor: Double) {
		self.marca = marca
		self.modelo = modelo
		self.valor = valor
	}
	
	func imprimir() {
		print(self.marca ?? "")
		print(self.modelo ?? "")
		print(self.valor ?? "")
	}
	
}

var lenovo: Notebook = Notebook(marca: "Lenovo", modelo: "", valor: 0)
var dell: Notebook = Notebook(marca: "Dell")

dell.modelo
lenovo.modelo


//MARK: - Herança

class Veiculo {
	var tipo: String?
	var ano: Int?
	
	init(tipo: String, ano: Int) {
		self.tipo = tipo
		self.ano = ano
	}
	
	func ligarMotor() {
		print("Ligando motor")
	}
	
}

class Carro: Veiculo {
	
	var cor: String?
	
	override func ligarMotor() {
		print("Carro")
		super.ligarMotor()
	}
	
}

class Motocicleta: Veiculo {}








