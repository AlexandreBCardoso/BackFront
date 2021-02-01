//
//  main.swift
//  Ex002-Funcoes
//
//  Created by Alexandre Cardoso on 27/01/21.
//

import Foundation


// MARK: - Exercicio 01
/*
		1. Definir três métodos que imprimam saudações diferentes em tela e
			 sejam executados da seguinte forma:
			 cumprimentarA(pessoa: “João”)
			 cumprimentarB(a: “João”)
			 cumprimentarC(“João”)
*/
func cumprimentarA(pessoa: String) {
	print("Bom dia \(pessoa)!")
}

func cumprimentarB(a: String) {
	print("Boa tarde \(a)!")
}

func cumprimentarC(_ pessoa: String) {
	print("Boa noite \(pessoa)!")
}

//cumprimentarA(pessoa: "João")
//cumprimentarB(a: "João")
//cumprimentarC("João")


// MARK: - Exercicio 02
/*
		2. Escrever o método eMenor(oPrimeiro: Int, oSegundo: Int) -> Bool
			 deve usar dois números inteiros como parâmetros e retornar true
			 Se o primeiro número for menor que o segundo número ou false , caso contrário.
			 a. Invocar o método com os números 3 e 5 e imprimir na tela o resultado.
			 b. Invocar o método com os números 7 e 5 e imprimir na tela o resultado.
			 c. Invocar o método com os números 10 e 10; e imprimir na tela o resultado.
*/
func eMenor(oPrimeiro: Int, oSegundo: Int) -> Bool {
	if oPrimeiro < oSegundo {
		return true
	} else {
		return false
	}
}

//print(eMenor(oPrimeiro: 3, oSegundo: 5))
//print(eMenor(oPrimeiro: 7, oSegundo: 5))
//print(eMenor(oPrimeiro: 10, oSegundo: 10))


// MARK: - Exercicio 03
/*
		3. Escrever o método ePar(umNumero: Int) -> Bool deve analisar um número inteiro e
			 retornar true se o número for par ou false , caso contrário.
			 Ajuda: o operador % calcula o resto da divisão entre dois números inteiros.
			 (Ex.: “5 % 2” dá 1 como resultado; enquanto “4 % 2” dá 0 como resultado).
			 a. Invocar o método com o número 1 e imprimir na tela o resultado.
			 b. Invocar o método com o número 2 e imprimir na tela o resultado.
*/
func ePar(umNumero: Int) -> Bool {
	if (umNumero % 2) == 0 {
		return true
	} else {
		return false
	}
}

//print(ePar(umNumero: 1))
//print(ePar(umNumero: 2))


// MARK: - Exercicio 04
/*
		4. Escrever o método eImparMaiorQueDez(umNumero: Int) -> Bool que deve analisar
			 um número inteiro como parâmetro e retornar true se o número for ímpar e maior do que dez
       e false, caso contrário.
			 A. Invocar o método com o número 3 e imprimir na tela o resultado.
			 B. Invocar o método com o número 4 e imprimir na tela o resultado.
			 C. Invocar o método com o número 13 e imprimir na tela o resultado.
			 D. Invocar o método com o número 14 e imprimir na tela o resultado.
*/
func eImparMaiorQueDez(umNumero: Int) -> Bool {
	if (umNumero % 2) == 1 && umNumero > 10 {
		return true
	} else {
		return false
	}
}

//print(eImparMaiorQueDez(umNumero: 3))
//print(eImparMaiorQueDez(umNumero: 4))
//print(eImparMaiorQueDez(umNumero: 13))
//print(eImparMaiorQueDez(umNumero: 14))


// MARK: - Exercicio 05
/*
		5. Escrever o método maximoEntreTresNumeros(umNumeroA: Int, umNumeroB: Int, umNumeroC: Int) -> Int
			 que deve analisar três números inteiros como parâmetros e retornar o máximo entre os três números.
			 A. Invocar o método com os números 2, 5 e 11 e imprimir em tela o resultado.
*/
func maximoEntreTresNumeros(umNumeroA: Int, umNumeroB: Int, umNumeroC: Int) -> Int {
	let numeros: [Int] = [umNumeroA, umNumeroB, umNumeroC]
	return numeros.max() ?? 0
}

//print(maximoEntreTresNumeros(umNumeroA: 2, umNumeroB: 5, umNumeroC: 11))



// MARK: - Exercicio 06
/*
		16. Escrever o método imprimirImparesPositivos() -> Void que imprima na tela os
				primeiros 100 números inteiros positivos ímpares.
*/
func imprimirImparesPositivos() {
	for num in 1...100 {
		if (num % 2) == 1 {
			print("Número inteiro positivo ímpar: \(num)")
		}
	}
}

imprimirImparesPositivos()
