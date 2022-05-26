import UIKit

class Carro {
	
	private var modelo: String
	
	init(modelo: String) {
		self.modelo = modelo
	}
	
	func getModelo() -> String {
		return self.modelo
	}
}

// Instancia de Carro
var opala: Carro = Carro(modelo: "Opala")


//MARK: - Enum

enum TipoDeCorrida {
	case corridaX
	case corridaPool
	case corridaBlack
}

class Motorista {
	private var nome: String
	private var cpf: String
	private var placa: String
	private var saldo: Double
	
	init(nome: String, cpf: String, placa: String, saldo: Double) {
		self.nome  = nome
		self.cpf   = cpf
		self.placa = placa
		self.saldo = saldo
	}
	
	func viajar(tipoCorrida: TipoDeCorrida, valor: Double) {
		
		switch tipoCorrida {
			case .corridaX:
				self.calcularViagemX(valor: valor)
				
			case .corridaPool:
			self.calcularViagemPool(valor: valor)
			
			case .corridaBlack:
			self.calcularViagemBlack(valor: valor)
			
		}
		
	}
	
	private func calcularViagemX(valor: Double) {
		self.saldo = valor + (valor * 0.25)
	}
	
	private func calcularViagemPool(valor: Double) {
		self.saldo = valor + (valor * 0.10)
	}
	
	private func calcularViagemBlack(valor: Double) {
		self.saldo = valor + (valor * 1.4)
	}
	
	func getSaldo() -> Double {
		return self.saldo
	}
	
}


var lucas: Motorista = Motorista(nome: "Lucas", cpf: "123.456.789-09", placa: "ABC-1245", saldo: 0)

lucas.viajar(tipoCorrida: .corridaBlack, valor: 20)
//print(lucas.getSaldo())


//MARK: - Struct



var arrayCores: [String] = ["Vermelho", "Amarelo", "Verde", "Vermelho", "Amarelo", "Verde"]
print("Array: \(arrayCores)")

var setCores: ([String]) = (["Vermelho", "Amarelo", "Verde", "Vermelho", "Amarelo", "Verde"])
print("Set: \(setCores)")


setCores = arrayCores
print("Set recebendo array: \(setCores)")



