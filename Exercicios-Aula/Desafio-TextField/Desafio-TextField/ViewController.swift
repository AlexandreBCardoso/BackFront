//
//  ViewController.swift
//  Desafio-TextField
//
//  Created by Alexandre Cardoso on 03/02/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var enderecoTextField: UITextField!
	@IBOutlet weak var senhaTextField: UITextField!
	@IBOutlet weak var cadastrarButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configurarTextField()
		
		// Atributo para Habilitar/Desabilitar Button
		self.cadastrarButton.isEnabled = false
		
		// Atributo para colocar borda no Button
		self.cadastrarButton.layer.cornerRadius = 20
		
	}
	
	// Método para Configuração de TextField
	func configurarTextField() {
		
		// Atribuição de delegate do TextField
		self.nomeTextField.delegate			= self
		self.enderecoTextField.delegate	=	self
		self.senhaTextField.delegate		= self
	}
	
	
	// Método chamado ao Clicar no TextField (foco)
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("textFieldDidBeginEditing")
		textField.layer.borderWidth = 2.0
		textField.layer.borderColor = UIColor.blue.cgColor
	}
	
	
	// Método chamado ao Clicar no Botão "Return"
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("textFieldShouldReturn")
		
		// Verifica se todos os TextField estão preenchidos
		if self.nomeTextField.text != "" && self.enderecoTextField.text != "" && self.senhaTextField.text != "" {
			self.cadastrarButton.isEnabled = true
			textField.layer.borderWidth = 2.0
			textField.layer.borderColor = UIColor.lightGray.cgColor
		}
		
		// Atributo para ocultar o teclado
		textField.resignFirstResponder()
		
		return false
	}
	
	
	// Método chamdo quando sair do foco do TextField
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("textFieldDidEndEditing")
		
		// Verifica se tem valor no TextField
		if textField.text == "" {
			textField.layer.borderWidth = 2.0
			textField.layer.borderColor = UIColor.red.cgColor
		} else {
			textField.layer.borderWidth = 2.0
			textField.layer.borderColor = UIColor.lightGray.cgColor
		}
		
	}
	
	
	// Método de execução do Botão
	@IBAction func cadastrarAction(_ sender: UIButton) {
		print("Cadastro realizado com sucesso!")
	}
	
}

