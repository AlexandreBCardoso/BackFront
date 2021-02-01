//
//  main.swift
//  Ex002-Tamagotchi
//
//  Created by Alexandre Cardoso on 28/01/21.
//

import Foundation


// MARK: - Exercicio 01
/*
		1. Vamos modelar um Tamagotchi (animal de estimação virtual)
			 seguindo as seguintes condições:
		O Tamagotchi pode estar em apenas um dos seguintes estados:
				Feliz
				Triste
				Fome
				Sede
		É possível dar os seguintes estímulos ao Tamagotchi:
				Dar água
				Dar comida
				Fazer carinho
		
		A. Se dermos comida ao Tamagotchi quando estiver com fome, ele ficará feliz.
		B. Se dermos comida ao Tamagotchi quando estiver triste, ele emitirá 2 bipes
			e a tela o mostrará vomitando.
		C. Se dermos comida ao Tamagotchi quando estiver com sede, nada acontecerá.
		D. Se dermos comida ao Tamagotchi quando estiver feliz, nada acontecerá.
		E. Se dermos água ao Tamagotchi quando estiver com sede, ele ficará feliz.
		F. Se dermos água ao Tamagotchi quando estiver feliz, ele emitirá 5 bipes.
		G. Se dermos água ao Tamagotchi quando estiver triste, ele emitirá 5 bipes e a tela piscará.
		H. Se dermos água ao Tamagotchi quando estiver com fome, nada acontecerá.
		I. Se fizermos carinho no Tamagotchi quando estiver triste, ele ficará feliz.
		J. Se fizermos carinho no Tamagotchi quando estiver feliz, nada acontecerá.
		L. Se fizermos carinho no Tamagotchi quando estiver com fome, nada acontecerá.
		M. Se fizermos carinho no Tamagotchi quando estiver com sede, nada acontecerá.

		1. Criar um diagrama de classes do modelo enunciado sem levar em consideração os bipes e o que acontece na tela.
		2. Criar um diagrama de sequência da execução do estímulo “Dar comida ao Tamagotchi quando estiver com fome”.
*/
enum EstadoTamagotchi {
	case Feliz
	case Triste
	case Fome
	case Sede
}

enum EstimuloTamagotchi {
	case DarAgua
	case DarComida
	case FazerCarinho
}

class Tamagotchi {
	
	var estimulo: EstimuloTamagotchi
	var estado: EstadoTamagotchi
	
	init(estimulo: EstimuloTamagotchi, estado: EstadoTamagotchi) {
		self.estado = estado
		self.estimulo = estimulo
	}
	
	func reacaoTamagotchi() {
		
		switch (self.estimulo, self.estado) {
			
			case (EstimuloTamagotchi.FazerCarinho, EstadoTamagotchi.Sede),
					(EstimuloTamagotchi.DarComida, EstadoTamagotchi.Sede),
					(EstimuloTamagotchi.DarComida, EstadoTamagotchi.Feliz),
					(EstimuloTamagotchi.DarAgua, EstadoTamagotchi.Fome),
					(EstimuloTamagotchi.FazerCarinho, EstadoTamagotchi.Feliz),
					(EstimuloTamagotchi.FazerCarinho, EstadoTamagotchi.Fome):
				print("nada acontecerá")
				
			case (EstimuloTamagotchi.DarComida, EstadoTamagotchi.Fome),
					 (EstimuloTamagotchi.DarAgua, EstadoTamagotchi.Sede),
					 (EstimuloTamagotchi.FazerCarinho, EstadoTamagotchi.Triste):
				print("Tamagotchi feliz")
				
			case (EstimuloTamagotchi.DarComida, EstadoTamagotchi.Triste):
				print("🤮")
				
			case (EstimuloTamagotchi.DarAgua, EstadoTamagotchi.Feliz),
					 (EstimuloTamagotchi.DarAgua, EstadoTamagotchi.Triste):
				print("Tamagotchi 😀😀😀😀😀")
		}
	}
}

let tamagotchi_01 = Tamagotchi(estimulo: .DarComida, estado: .Fome)
tamagotchi_01.reacaoTamagotchi()
let tamagotchi_02 = Tamagotchi(estimulo: .DarComida, estado: .Triste)
tamagotchi_02.reacaoTamagotchi()
let tamagotchi_03 = Tamagotchi(estimulo: .DarComida, estado: .Sede)
tamagotchi_03.reacaoTamagotchi()
let tamagotchi_04 = Tamagotchi(estimulo: .DarComida, estado: .Feliz)
tamagotchi_04.reacaoTamagotchi()
let tamagotchi_05 = Tamagotchi(estimulo: .DarAgua, estado: .Sede)
tamagotchi_05.reacaoTamagotchi()
let tamagotchi_06 = Tamagotchi(estimulo: .DarAgua, estado: .Feliz)
tamagotchi_06.reacaoTamagotchi()
let tamagotchi_07 = Tamagotchi(estimulo: .DarAgua, estado: .Triste)
tamagotchi_07.reacaoTamagotchi()
let tamagotchi_08 = Tamagotchi(estimulo: .DarAgua, estado: .Fome)
tamagotchi_08.reacaoTamagotchi()
let tamagotchi_09 = Tamagotchi(estimulo: .FazerCarinho, estado: .Triste)
tamagotchi_09.reacaoTamagotchi()
let tamagotchi_10 = Tamagotchi(estimulo: .FazerCarinho, estado: .Feliz)
tamagotchi_10.reacaoTamagotchi()
let tamagotchi_11 = Tamagotchi(estimulo: .FazerCarinho, estado: .Fome)
tamagotchi_11.reacaoTamagotchi()
let tamagotchi_12 = Tamagotchi(estimulo: .FazerCarinho, estado: .Sede)
tamagotchi_12.reacaoTamagotchi()
