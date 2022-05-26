//
//  Tela02ViewController.swift
//  Ex01-ProtocolDelegate
//
//  Created by Alexandre Cardoso on 09/02/21.
//

import UIKit

protocol CadastroDelegate {
	func valorNome(_ valor: String)
	func valorTelefone(_ valor: String)
	func valorEmail(_ valor: String)
	func validado(_ nome: String, _ telefone: String, _ email: String)
}

class Tela02ViewController: UIViewController {
	
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var telefoneTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	
	var delegate: CadastroDelegate?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTextField()
	}
	
	
	// MARK: - Functions
	
	func configTextField() {
		
		// Atribuição de Delegate
		self.nomeTextField.delegate = self
		self.telefoneTextField.delegate = self
		self.emailTextField.delegate = self
		
		self.telefoneTextField.keyboardType = .numberPad
		self.emailTextField.keyboardType = .emailAddress
	}
	
	
	// MARK: - Actions
	
	@IBAction func tappedSalvar(_ sender: UIButton) {
		
		guard let nomeString = self.nomeTextField.text,
					let telefoneString = self.telefoneTextField.text,
					let emailString = self.emailTextField.text else { return }
		
		if nomeString != "" && telefoneString != "" && emailString != "" {
			self.delegate?.validado(nomeString, telefoneString, emailString)
		}
		
	}
	
	
	
}


// MARK: - Extension-TextFieldDelegate

extension Tela02ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		switch textField {
			case self.nomeTextField:
				self.delegate?.valorNome(self.nomeTextField.text ?? "")
				
			case self.telefoneTextField:
				self.delegate?.valorTelefone(self.telefoneTextField.text ?? "0000-0000")
				
			case self.emailTextField:
				self.delegate?.valorEmail(self.emailTextField.text ?? "")
				
			default:
				print("textField zuado!")
		}
		
		textField.resignFirstResponder()
		
		return false
	}
	
}
