//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Alexandre Cardoso on 03/02/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var enderecoTextField: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTextField()
	}
	
	func configTextField() {
		self.nomeTextField.delegate = self
		self.enderecoTextField.delegate = self
		
		self.nomeTextField.layer.borderWidth = 2.0
		self.enderecoTextField.layer.borderWidth = 2.0
		
		
		
	}
	
	
	// MARK: - Funções de Delegate
	
	// Método chamado ao clicar no TextField
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("textFieldDidBeginEditing")
		print(textField.text ?? "")
		print("-----------------------------------------")
	}
	
	// Método chamado ao clicar no botão "Return"
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("textFieldShouldReturn")
		
		// função para baixar o Teclado
		textField.resignFirstResponder()
		print("-----------------------------------------")
		
		// Verifica qual TextField está sendo executado.
		switch textField {
			
			case self.nomeTextField:
				print("Text Field - Nome")
				
			case self.enderecoTextField:
				print("Text Field - Endereco")
				
			default:
				print("Nada")
		}
		
		return false
	}
	
	// Método chamado quando é trocado o foco do TextField
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("textFieldDidEndEditing")
	}

	
}

