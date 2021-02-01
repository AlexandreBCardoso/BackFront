//
//  main.swift
//  Ex001_Banco_Santander_Array
//
//  Created by Alexandre Cardoso on 25/01/21.
//

import Foundation


// Classe - Conta
class Conta {
	
	// Metodo - Depósito
	func deposito(grana: Double) {
		print("deposito")
	}
	
	// Método - Sacar Dinheiro
	func sacarDinheiro(grana: Double) -> Bool {
		print("Sacar Dinheiro")
		return true
	}
	
	// Método - Consultar Saldo
	func consultarSaldo() -> Double {
		return 0.0
	}
	
}

// Classe - ContaPoupança
class ContaPoupanca: Conta {
	var saldo: Double
	
	init(saldo: Double) {
		self.saldo = saldo
	}
	
	override func deposito(grana: Double) {
		self.saldo += grana
	}
	
	override func sacarDinheiro(grana: Double) -> Bool {
		if saldo >= grana {
			self.saldo -= grana
			return true
		} else {
			return false
		}
	}
	
	override func consultarSaldo() -> Double {
		return saldo
	}
	
	func recolherJuros() {
	}
	
}

//let lucas = ContaPoupanca(saldo: 100)
//
//print(lucas.consultarSaldo())
//lucas.deposito(grana: 50.0)
//print(lucas.consultarSaldo())
//print(lucas.sacarDinheiro(grana: 100.0))
//print(lucas.consultarSaldo())


// Classe - ContaCorrete
class ContaCorrente: Conta {
	
	var saldo: Double
	var limiteAutorizado: Double = 10_000
	
	init(saldo: Double, limiteAutorizado: Double = 10_000) {
		self.saldo = saldo
		self.limiteAutorizado = limiteAutorizado
	}
	
	override func consultarSaldo() -> Double {
		return saldo
	}
	
	func consultaLimite() -> Double {
		return limiteAutorizado
	}
	
	override func sacarDinheiro(grana: Double) -> Bool {
		let saldoTotal = saldo + limiteAutorizado
		
		if saldo >= grana {
			self.saldo -= grana
			return true
		}
		
		if saldoTotal >= grana {
			let valor1 = saldo - grana
			let valor2 = valor1 * -1
			self.saldo = 0
			self.limiteAutorizado -= valor2
			return true
		} else {
			return false
		}
	}
	
}


let junior = ContaCorrente(saldo: 0, limiteAutorizado: 80)


class Cliente {
	
	var numCliente: Int
	var sobrenome: String
	var numRG: String
	var numCNPJ: String
	
	init(numCliente: Int, sobrenome: String, numRG: String, numCNPJ: String) {
		self.numCliente = numCliente
		self.sobrenome = sobrenome
		self.numRG = numRG
		self.numCNPJ = numCNPJ
	}
	
}
