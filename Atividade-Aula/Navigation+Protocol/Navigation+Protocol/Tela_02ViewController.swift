//
//  Tela_02ViewController.swift
//  Navigation+Protocol
//
//  Created by Alexandre Cardoso on 08/02/21.
//

import UIKit

protocol Tela02VCProtocol {
	func testeProtocol(valor: String)
}


class Tela_02ViewController: UIViewController {
	
	@IBOutlet weak var valueLabel: UILabel!
	@IBOutlet weak var valueTextField: UITextField!
	
	var delegate: Tela02VCProtocol?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.valueTextField.delegate = self
	}
	
	func atribuirValor(valor: String) {
		self.valueLabel.text = valor
	}
	
	
	@IBAction func tappedVoltarTela(_ sender: UIButton) {
//		print("tappedVoltarTela")
//		self.delegate?.testeProtocol(valor: "Enviando dados para Protocol")
		self.navigationController?.popViewController(animated: true)
	}
	
	
}

extension Tela_02ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.delegate?.testeProtocol(valor: textField.text ?? "Não preencheu")
		textField.resignFirstResponder()
		return false
	}
	
}
