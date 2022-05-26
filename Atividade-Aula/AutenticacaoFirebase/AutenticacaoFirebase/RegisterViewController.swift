//
//  RegisterViewController.swift
//  AutenticacaoFirebase
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var senhaTextField: UITextField!
	@IBOutlet weak var filmeIDTextField: UITextField!
	@IBOutlet weak var nomeFilmeTextField: UITextField!
	@IBOutlet weak var descricaoFilmeTextField: UITextField!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedRegisterButton(_ sender: UIBarButtonItem) {
		let email = self.emailTextField.text ?? ""
		let senha = self.senhaTextField.text ?? ""
		let autenticacao: Auth = Auth.auth()
		
		autenticacao.createUser(withEmail: email, password: senha) { (authResult, error) in
			
			if error != nil {
				print("Deu ruim no Cadastro!! 😠")
				return
			}
			
			if let _ = authResult {
				
				// Configurar Database
				let database = Database.database().reference()
				let usuarios = database.child("usuarios")
//				let listwatch = database.child("listwatch").child("usuarios")
				let listMovie = database.child("listwatch").child("usuarios").child(autenticacao.currentUser?.uid ?? "")
				
				// Salvar no banco de dados do Usuario
				let dadosUsuario = [
					"email": autenticacao.currentUser?.email,
					"senha": senha
				]
				
				let rating: String? = "7.3"
				let fotoURL: String? = ".jpeg"
				let favorito: String? = "X"
				let assistir: String? = ""
				
				let detalheFilme = [
					"movieID": self.filmeIDTextField.text,
					"name": self.nomeFilmeTextField.text,
					"genero": self.descricaoFilmeTextField.text,
					"rating": rating,
					"foto": fotoURL,
					"favorito": favorito,
					"assistir": assistir
				]
				
				// Enviar para o Banco de Dados
				usuarios.child(autenticacao.currentUser?.uid ?? "").setValue(dadosUsuario)
				
//				listwatch.child(autenticacao.currentUser?.uid ?? "").setValue(dadosUsuario)
				
				listMovie.child(self.filmeIDTextField.text ?? "").setValue(detalheFilme)
				
				print("==== Sucesso ====")
				
			} else {
				
				print("Usuario Estranho!!!")
			}
			
		}
		
	}
	
}
