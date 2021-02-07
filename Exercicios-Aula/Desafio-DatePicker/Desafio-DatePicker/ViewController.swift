//
//  ViewController.swift
//  Desafio-DatePicker
//
//  Created by Alexandre Cardoso on 07/02/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var telefoneTextField: UITextField!
	@IBOutlet weak var datePicker: UIDatePicker!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var telefoneLabel: UILabel!
	@IBOutlet weak var dataNascimentoLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configDatePicker()
		
		// Ligação de Delegate TextField
		nomeTextField.delegate = self
		telefoneTextField.delegate = self
	}
	
	func configDatePicker() {
		// Atributo para localização Brasil
		self.datePicker.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
	}
	
	// Método chamado ao clicar no botão Return
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}

	@IBAction func tappedDatePicker(_ sender: UIDatePicker) {
		// DateFormatter - Classe para Formatar a data
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .short
		dateFormatter.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
		
		let valorData = dateFormatter.string(from: sender.date)
		
		if let valorNome = self.nomeTextField.text {
			self.nomeLabel.text = "Nome: \(valorNome)"
		}
		
		if let valorTelefone = self.telefoneTextField.text {
			self.telefoneLabel.text = "Telefone: \(valorTelefone)"
		}

		dataNascimentoLabel.text = "Data Nascimento: " + valorData
		
	}
	
}

