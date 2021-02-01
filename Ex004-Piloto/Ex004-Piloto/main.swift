//
//  main.swift
//  Ex004-Piloto
//
//  Created by Alexandre Cardoso on 31/01/21.
//

import Foundation


/*
		Criar uma estrutura Hierárquica que contenha as seguintes classes: Veículo ,
		Bicicleta e Automóvel. Os métodos da classe Veiculo possuem as seguintes funções
		listarVerificacoes() ajustar() limpar() Estes métodos são implementados nas
		subclasses Automóvel e Bicicleta. Acrescentar na classe Automóvel o método
		mudarOleo(), Criar também a classe Oficina que terá dois métodos, proximo() que
		retorna aleatoriamente um objecto do tipo bicicleta ou automóvel e
		manutencao(Veiculo: veiculo) que recebe como parâmetro um objecto do tipo
		veiculo e chama os métodos definidos na classe veiculo listarVerificacoes() ajustar()
		limpar() se o veiculo for Automóvel deve também chamar o método mudarOleo()
		Extra: Criar uma classe Piloto, que possui vários veículos na sua garagem e possui 3
		funções, pilotar(Veiculo: veiculo) e listarVeiculos()
		OBS: As classes Veículo, Bicicleta, Automóvel e Piloto devem ter as propriedades
		que você julgar necessário
*/
class Veiculo {
	
	var consertado: Bool = false
	
	func listarVerificacoes() {
		print("Método Listar Verificações")
	}
	
	func ajustar() {
		print("Método Ajustar")
	}
	
	func limpar() {
		print("Método Limpar")
	}
	
}

class Automovel: Veiculo {
	
	var dono: String
	var modelo: String
	var marca: String
	
	init(dono: String, modelo: String, marca: String) {
		self.dono = dono
		self.modelo = modelo
		self.marca = marca
	}
	
	func mudarOleo() {
		print("Método Mudar Oleo")
	}
}

class Bicicleta: Veiculo {
	
	var dono: String
	var modelo: String
	var marca: String
	
	init(dono: String, modelo: String, marca: String) {
		self.dono = dono
		self.modelo = modelo
		self.marca = marca
	}
	
}

class Oficina {
	
	private var veiculo: Veiculo
	
	var veiculos = [Veiculo]()
	
	init(veiculo: Veiculo, consertado: Bool) {
		self.veiculo = veiculo
		adicionaListaVeiculo(veiculo: self.veiculo)
	}
	
	func adicionaListaVeiculo(veiculo: Veiculo) {
		self.veiculos.append(veiculo)
	}
	
	func listaVeiculosPendente() -> [Veiculo] {
		var listaVeiculos = [Veiculo]()
		
		for item in veiculos {
			if item.consertado == false {
				
				if let carro = item as? Automovel {
					print("Item Carro - \(carro.marca)")
				}
				
				if let bicicleta = item as? Bicicleta {
					print("Item Bicicleta - \(bicicleta.marca)")
				}

				listaVeiculos.append(item)
			}
		}
		
		return listaVeiculos
		
	}
	
	func proximo() -> Veiculo {
		let quantidade = veiculos.count - 1
		let numAleatorio = Int.random(in: 0...quantidade)
		return veiculos[numAleatorio]
	}
	
	func manutencao(veiculo: Veiculo) {
		let carro = veiculo as? Automovel
		let bicicleta = veiculo as? Bicicleta
		
		
		
		veiculo.listarVerificacoes()
		veiculo.ajustar()
		
		if carro != nil {
			carro!.mudarOleo()
		}
		
		veiculo.limpar()
		
		veiculo.consertado = true
		
		print("Manutenção feita! Obrigado pela preferência Cliente \(String(describing: carro?.dono ?? bicicleta?.dono ?? "."))")
	}
}


// Instancia - Automóvel
let carro1 = Automovel(dono: "Pedro", modelo: "Gol", marca: "Volkswagen")

// Instancia - Bicicleta
let bicicleta1 = Bicicleta(dono: "João", modelo: "M1 NEW EXPERT", marca: "GTS")

// Instancia - Oficina
let oficina1 = Oficina(veiculo: carro1, consertado: false)
oficina1.adicionaListaVeiculo(veiculo: bicicleta1)

oficina1.manutencao(veiculo: carro1)
oficina1.manutencao(veiculo: bicicleta1)
print(oficina1.proximo())
print(oficina1.proximo())



