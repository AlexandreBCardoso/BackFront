//
//  main.swift
//  Ex001_Conceito_Basico
//
//  Created by Alexandre Cardoso on 25/01/21.
//

import Foundation


// MARK: - Exercicio 01
/*
		1. Imprimir na tela “Hello World
*/
//print("Hello World")

// MARK: - Execicio 02
/*
		2. Declarar a variável “umNumeroA” do tipo Int e atribuir um valor a ela.
			 Declarar a variável “umNumeroB” de tipo Double e atribuir um valor a ela.
			 Declarar la variável “umString” de tipo String e atribuir um valor a ela.
			 Em seguida, imprimir na tela:
				a. O valor de cada variável.
				b. A soma de umNumeroA + umNumeroB.
				c. A diferença entre umNumeroA - umNumeroB.
*/
let umNumeroA: Int = 4
let umNumeroB: Double = 1_000.0
let umString: String = "Alexandre"

//print(umNumeroA)
//print(umNumeroB)
//print(umString)

let somaNumero = umNumeroA + Int(umNumeroB)
//print("Soma: \(somaNumero)")

let diferente = umNumeroA - Int(umNumeroB)
//print("Diferença: \(diferente)")


// MARK: - Exercicio 03
/*
		3. Imprimir na tela o número de segundos existentes em um ano.
*/
var segundos: Int = 60
var minutos: Int = 60
var horas: Int = 24
var diaSegundos: Int = horas * (minutos * segundos)
var ano: Int = 365
var anoSegundos: Int = ano * diaSegundos
//print("Segundos existente em um ano: \(anoSegundos)")


// MARK: - Exercicio 04
/*
		4. Declarar a variável “umNumeroC” de tipo Int e atribuir um valor de vários dígitos a ela.
			 Imprimir na tela seu último dígito.
*/
let umNumeroC: Int = 228374982749823749
let stringNumero = String(umNumeroC)
//print("Ultimo numero: \(String(describing: stringNumero.last))")


// MARK: - Exercicio 05
/*
		5. Declarar duas variáveis “a” e “b” (do mesmo tipo) e atribuir um número a cada uma.
			 Intercambiar seus valores para que o valor de “a” passe a ser o valor de “b” e vice-versa.
			 Ajuda: é possível definir novas variáveis se for
*/
var a: Int = 5
var b: Int = 10
var c: Int = a
//print("valor A :\(a)")
//print("valor B :\(b)")
a = b
b = c
//print("valor A :\(a)")
//print("valor B :\(b)")


// MARK: - Exercicio 06
/*
		6. Declarar a seguintes variáveis: “w”, “x”, “y”, “z”; atribuindo um número entre 1 e 50 a cada uma.
			 Declarar uma variável “valor1” e atribuir o número 23 a ela.
			 Declarar uma variável “valor2” e atribuir o número 34 a ela.
			 Imprimir na tela “ASD” se “valor1” for maior que “w” e menor que “x” e
			 se “valor2” for maior que “y” e menor que “z”. Caso contrário, imprimir “
*/
let w: Int = Int.random(in: 1...50)
let x: Int = Int.random(in: 1...50)
let y: Int = Int.random(in: 1...50)
let z: Int = Int.random(in: 1...50)
let valor1 = 23
let valor2 = 34

//print("Valor W: \(w)")
//print("Valor X: \(x)")
//print("Valor Y: \(y)")
//print("Valor Z: \(z)")

if valor1 > w && valor1 < x {
//	print("ASD")
}

if valor2 > y && valor2 < z {
//	print("XYZ")
}


// MARK: - Exercicio 07
/*
		7. Imprimir na tela os primeiros dez números naturais elevados ao quadrado.
*/
//for numero in 1...10 {
//	let quadrado = pow(Decimal(numero), 2)
//	print("Numero \(numero) elevado ao quadrado \(quadrado)")
//}


// MARK: - Exercicio 08
/*
		8. Imprimir na tela a soma dos primeiros dez números naturais ÍMPARES elevados ao quadrado.
*/
//for numero in 1...10 {
//	let impar = numero % 2
//
//	if impar == 1 {
//		print("Valores Impar \(numero)")
//	}
//}


// MARK: - Exercicio 09
/*
		9. Imprimir números aleatórios entre 0 e 5, até que se imprima um 3.
			 Ajuda: A função arc4random_uniform(_ n: Int) (definida na biblioteca Foundation)
			 retorna um número aleatório entre 0 e o parâmetro, NÃO inclusive;
			 por exemplo: var numero = arc4random_uniform(10) // número que 0 <= número <
*/
var numAleatorio: Int

repeat {
	numAleatorio = Int.random(in: 0...5)
	print("Numero Aleatório: \(numAleatorio)")
} while numAleatorio != 3



