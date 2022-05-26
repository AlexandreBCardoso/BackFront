import UIKit



var umNumeroA: Int 		= 25
var umNumeroB: Double	= 3.14
var umString: String	= "Alexandre"
var resultadoSoma: Double = Double(umNumeroA) + umNumeroB
var resultadoSubtracao: Double = Double(umNumeroA) - umNumeroB

var segundos: Int = 60
var minutos: Int = 60
var horas: Int = 24
var diaSegundos: Int = horas * (minutos * segundos)
var ano: Int = 365
var anoSegundos: Int = ano * diaSegundos

//print("O valor da variável umNumeroA é: \(umNumeroA)")
//print("O valor da variável umNumeroB é: \(umNumeroB)")
//print("O valor da variável umString é: " + umString)
//print("A soma de \(umNumeroA) + \(umNumeroB) é: \(resultadoSoma)")
//print("A diferença entre \(umNumeroA) - \(umNumeroB) é: \(resultadoSubtracao)")
//print("Um ano tem \(anoSegundos) segundos.")


// Função CALCULADORA
func calculadora(valor1: Int, valor2: Int, valor3: Int) -> Double {
	return Double(valor1) + Double(valor2) + Double(valor3)
}

func descontoDoProduto(valorProduto: Int, porcentagemDesconto: Int) -> Double {
	let desconto:Double = (Double(valorProduto) * Double(porcentagemDesconto)) / 100
	return desconto
}

func validarIdade(idadeNascimento: Int) ->  Bool {
	if idadeNascimento >= 18 {
		return true
	} else {
		return false
	}
}

func mensagem(mensagem: String, repetir: Int) {
	var indice = 0
	
	while indice <= repetir {
		print("Você tem \(indice), " + mensagem)
		indice += 1
	}
	
}

func tipoDeCliente(valorProduto1: Int, valorProduto2: Int, valorProduto3: Int, valorProduto4: Int, valorProduto5: Int) -> String {
	
	let totalCompras: Int = valorProduto1 + valorProduto2 + valorProduto3 + valorProduto5
	print("Valor total das Compras: \(totalCompras)")
	
	if totalCompras < 100 {
		return "Cliente Economico"
		
	} else if totalCompras < 300 {
			return "Cliente Moderado"
		
	} else {
			return "Cliente Gastador"
	}
	
}


// Execução

//let testeCalculadora = calculadora(valor1: 10, valor2: 10, valor3: 10)
//print("Resultado função, Calculadora: \(testeCalculadora)")

//let testedescontoDoProduto = descontoDoProduto(valorProduto: 1250, porcentagemDesconto: 20)
//print("Resultado função, Desconto do Produto: \(testedescontoDoProduto)")

//let testeValidarIdade = validarIdade(idadeNascimento: 17)
//print("Resultado função, Validar Idade: \(testeValidarIdade)")

//mensagem(mensagem: "Bora codar!", repetir: 5)

let testeTipoDeCliente = tipoDeCliente(valorProduto1: 100000, valorProduto2: 0, valorProduto3: 50, valorProduto4: 0, valorProduto5: 0)
print("Resultado função, Tipo de Cliente: " + testeTipoDeCliente)

