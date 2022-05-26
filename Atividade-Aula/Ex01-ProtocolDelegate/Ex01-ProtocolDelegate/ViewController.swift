//
//  ViewController.swift
//  Ex01-ProtocolDelegate
//
//  Created by Alexandre Cardoso on 09/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var telefoneLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!

	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "SegueTela02" {
			let tela02VC = segue.destination as! Tela02ViewController
			tela02VC.delegate = self
		}
	}
	

}


// MARK: - Extensions
extension ViewController: CadastroDelegate {
	
	func valorNome(_ valor: String) {}
	
	func valorTelefone(_ valor: String) {}
	
	func valorEmail(_ valor: String) {}
	
	func validado(_ nome: String, _ telefone: String, _ email: String) {
		self.nomeLabel.text = "Nome: " + nome
		self.telefoneLabel.text = "Telefone: \(telefone)"
		self.emailLabel.text = "E-mail: " + email
	}
	
	
	
}

