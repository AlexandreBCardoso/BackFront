//
//  ViewController.swift
//  Desafio-PickerView
//
//  Created by Alexandre Cardoso on 07/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var telefoneTextField: UITextField!
	@IBOutlet weak var dataNascimentoDatePicker: UIDatePicker!
	@IBOutlet weak var generoPickerView: UIPickerView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var telefoneLabel: UILabel!
	@IBOutlet weak var dataNascimentoLabel: UILabel!
	@IBOutlet weak var generoLabel: UILabel!
	
	let generoArray: [String] = ["Masculino", "Feminino", "Indeciso"]
	var dataNascimento: String?
	var genero: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configDatePicker()
		self.configPickerView()
		self.configTextField()
		self.configToolbarTextField()
	}
	
	func configDatePicker() {
		self.dataNascimentoDatePicker.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
		self.dataNascimentoDatePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
		self.dataNascimentoDatePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
	}
	
	func configPickerView() {
		self.generoPickerView.delegate = self
	}
	
	func configTextField() {
		self.nomeTextField.delegate = self
		self.telefoneTextField.delegate = self
		self.telefoneTextField.keyboardType = .numberPad
	}
	
	func montaDadosSaida() {
		if self.nomeTextField.text != "" && self.telefoneTextField.text != "" && self.dataNascimento != nil && self.genero != nil {
			self.nomeLabel.text = "NOME: \(self.nomeTextField.text ?? "")"
			self.telefoneLabel.text = "TELEFONE: \(self.telefoneTextField.text ?? "")"
			self.dataNascimentoLabel.text = "DATA NASCIMENTO: \(self.dataNascimento ?? "")"
			self.generoLabel.text = "GENERO: \(self.genero ?? "")"
		}
	}
	
	func configToolbarTextField() {
		
		// Criação de UIToolbar
		let toolbar = UIToolbar()
		toolbar.barStyle = .default
		toolbar.isTranslucent = true
		toolbar.tintColor = .blue
		toolbar.backgroundColor = .white
		toolbar.sizeToFit()
		
		// Criação dos botões da Toolbar
		let cancelButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(finish))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		
		// Associação dos botões na Toolbar
		toolbar.setItems([spaceButton, cancelButton], animated: true)
		toolbar.isUserInteractionEnabled = true
		
		// Associação do Toolbar ao TextField.
		self.telefoneTextField.inputAccessoryView = toolbar
		self.nomeTextField.inputAccessoryView = toolbar
		
	}
	
	@objc func finish() {
		self.telefoneTextField.resignFirstResponder()
	}

	@IBAction func tappedDataNascimento(_ sender: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .short
		dateFormatter.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
		
		let valorDate = dateFormatter.string(from: sender.date)
		
		self.dataNascimento = valorDate
		
		self.montaDadosSaida()
	}


}


// MARK: - Extension UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		self.montaDadosSaida()
		return false
	}

	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if let textoDigitando = textField.text {
			print(textoDigitando)
		}
	}
	
}


// MARK: - Extension UIPickerViewDelegate / UIPickerViewDataSource
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return generoArray.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return generoArray[row]
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.genero = self.generoArray[row]

		self.montaDadosSaida()
	}
	
	
}

