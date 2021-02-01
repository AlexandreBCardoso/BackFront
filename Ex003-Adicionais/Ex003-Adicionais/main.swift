//
//  main.swift
//  Ex003-Adicionais
//
//  Created by Alexandre Cardoso on 31/01/21.
//

import Foundation


// MARK: - Exercicio 01
/*
		1. RUN LENGTH ENCODING
			 Run-length encoding (RLE) é um mecanismo de compressão, em que elementos iguais e
			 consecutivos são substituídos por um único elemento e um valor contador que mostra seu número de repetições.
			 Por exemplo, o texto original indicado a seguir (53 caracteres) pode ser representado com apenas 13 caracteres de forma comprimida:
					"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" -> "12WB12W3B24WB"
			 É necessário:
				- Definir o método comprimirRLE(texto: String) -> String que, dado o texto recebido como parâmetro,
					retorna a representação comprimida. Supomos que o texto a ser comprimido só contém letras e NÃO está vazio.
*/
func comprimirRLE(texto: String) -> String {
	var textoComprimido = String()
	let arrayTexto = Array(texto)
	
	var dicTexto = [String.Element:Int]()
	var letraAnterior: String.Element = "A"
	
	for (index, letra) in arrayTexto.enumerated() {
		
		if index == 0 {
			dicTexto[letra] = 1
			letraAnterior = letra
			continue
		}
		
		if let valor = dicTexto[letra] {
			dicTexto[letra] = valor + 1
			
		} else {
			
			// Verifica se quantidade de letra:
			// Caso positivo, utilizar somente a Letra
			// Caso negativo, informar a quantidade e a letra
			if dicTexto[letraAnterior] == 1 {
				textoComprimido = textoComprimido + String(letraAnterior)
			} else {
				let quantidade = dicTexto[letraAnterior]
				textoComprimido = textoComprimido + String(quantidade ?? 0) + String(letraAnterior)
			}
			
			// Remover a Letra comprimida
			dicTexto.removeValue(forKey: letraAnterior)
			
			// Adicionar a nova letra
			dicTexto[letra] = 1
			letraAnterior = letra
		}
		
		// Caso seja o ultimo index
		if index == arrayTexto.count - 1 {
			
			if dicTexto[letra] == 1 {
				textoComprimido = textoComprimido + String(letra)
			} else {
				let quantidade = dicTexto[letraAnterior]
				textoComprimido = textoComprimido + String(quantidade ?? 0) + String(letra)
			}
		}
		
	}
	
	return textoComprimido
}

//print(comprimirRLE(texto: "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"))
//print(comprimirRLE(texto: "AABCCCDEEEE"))


// MARK: - Exercicio 02
/*
		2. CRIPTOGRAFIA CÉSAR
			 Definir o método criptografiaCesar(texto : String, deslocamento: Int) ->
			 String que deve analisar um texto e um número inteiro e codificar o texto utilizando o
			 método de criptografia César. Vamos supor que o texto contém apenas letras minúsculas e
			 sem acentos. Ou seja, o alfabeto terá 26 letras.
*/
func criptografiaCesar(texto : String, deslocamento: Int) -> String {
	var textoCripto = String()
	
	let arrayTexto = Array(texto)
	let alfabeto = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
									"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
	
	for letra in arrayTexto {
		
		let posicaoAlfabeto = (alfabeto.firstIndex(of: String(letra)) ?? 0)
		var posicaoCripto   = posicaoAlfabeto + deslocamento
		
		if posicaoCripto > 25 {
			posicaoCripto = (posicaoCripto - 25) - 1
			textoCripto = textoCripto + alfabeto[posicaoCripto]
		} else {
			textoCripto = textoCripto + alfabeto[posicaoCripto]
		}
		
	}
	
	return textoCripto
}

print(criptografiaCesar(texto: "casa", deslocamento: 3))
print(criptografiaCesar(texto: "zorro", deslocamento: 10))
