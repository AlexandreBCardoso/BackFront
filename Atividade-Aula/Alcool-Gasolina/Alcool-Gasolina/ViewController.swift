//
//  ViewController.swift
//  Alcool-Gasolina
//
//  Created by Alexandre Cardoso on 18/01/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var precoAlcoolTextField: UITextField!
	@IBOutlet weak var precoGasolinaTextField: UITextField!
	@IBOutlet weak var descricaoLabel: UILabel!
	@IBOutlet weak var calcularButton: UIButton!
	
	var precoAlcool: Double = 0.0
	var precoGasolina: Double = 0.0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	// Método para validar os preços
	func validarEntrada() -> Bool {
		
		// Cria variáveis e converte TextField em Double
		let alcool = Double(precoAlcoolTextField.text ?? "") ?? 0
		let gasolina = Double(precoGasolinaTextField.text ?? "") ?? 0
		
		// 1. Verificar se TextField é ZERO
		if alcool > 0 && gasolina > 0 {
			precoAlcool   = alcool
			precoGasolina = gasolina
			return true
		} else {
			return false
		}
		
	}
	
	// Método para calcular Combustível
	func calcularCombustivel() -> String {
		let total: Double = precoAlcool / precoGasolina
		
		if total >= 0.7 {
			return "Melhor utilizar Gasolina"
		} else {
			return "Melhor utilizar Alcool"
		}
		
	}
	
	
	@IBAction func tappedCalcularButton(_ sender: UIButton) {
		
		if calcularButton.titleLabel?.text == "Recalcular" {
			precoAlcoolTextField.text = ""
			precoGasolinaTextField.text = ""
			descricaoLabel.text = "Digite os Preços"
			calcularButton.setTitle("Calcular", for: .normal)
		} else {
			
			if validarEntrada() {
				descricaoLabel.text = calcularCombustivel()
				calcularButton.setTitle("Recalcular", for: .normal)
			} else {
				descricaoLabel.text = "Verifique os campos"
			}
			
		}
		
		
		
	}
	
}

