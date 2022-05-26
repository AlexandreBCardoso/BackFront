//
//  ViewController.swift
//  AutenticacaoFirebase
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var senhaTextField: UITextField!
	@IBOutlet weak var filmeIDTextField: UITextField!
	@IBOutlet weak var nomaFilmeTextField: UITextField!
	@IBOutlet weak var descricaoFilmeTextField: UITextField!
	
	
	
	// MARK: - Variable
	var controller: LoginController = LoginController()
	var autenticacao: Auth?
	var ref: DatabaseReference?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		autenticacao = Auth.auth()
		ref = Database.database().reference()
		
		ref?.child("listwatch").child("usuarios").child(autenticacao?.currentUser?.uid ?? "").observe(.value, with: { (snapshot) in
			guard let dictionary = snapshot.value as? [String: Any] else { return }
			print("Dicionario: \(dictionary)")
			print("Count: \(dictionary.count)")
			
			for value in dictionary {
				if let detalhe = value.value as? Dictionary<String, String> {
					print("Chave: \(value.key)")
					print("Detalhe: \(detalhe)")
					print("Nome: \(detalhe["name"] ?? "")")
				}
			}
			
		})
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.controller.getStatusLogin { (success) in
			if success {
				print("=== User Logado ===")
			}
		}
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedLoginButton(_ sender: UIButton) {
		let email: String = self.emailTextField.text ?? ""
		let senha: String = self.senhaTextField.text ?? ""
		
		autenticacao!.signIn(withEmail: email, password: senha) { (authResult, error) in
			if error != nil {
				print("Erro SIGNIN")
			} else {
				print("=== Logado ===")
			}
		}
		
	}
	
	@IBAction func tappedLogoutButton(_ sender: UIBarButtonItem) {
		do {
			try Auth.auth().signOut()
		} catch {
			print("++ Erro lo Log out ++")
		}
	}
	
	
	
	@IBAction func tappedSalvarButton(_ sender: UIButton) {
		print(#function)
		print("Usuario: \(autenticacao?.currentUser?.email)")
		print("UID: \(autenticacao?.currentUser?.uid)")
		
		// Configurar Database
		let listMovie = ref?.child("listwatch").child("usuarios").child(autenticacao?.currentUser?.uid ?? "")
		let rating: String? = "7.3"
		let fotoURL: String? = ".jpeg"
		let favorito: String? = "X"
		let assistir: String? = ""
		
		let detalheFilme = [
			"movieID": self.filmeIDTextField.text,
			"name": self.nomaFilmeTextField.text,
			"genero": self.descricaoFilmeTextField.text,
			"rating": rating,
			"foto": fotoURL,
			"favorito": favorito,
			"assistir": assistir
		]
		
		listMovie?.child(self.filmeIDTextField.text ?? "").setValue(detalheFilme)
		
	}
	
	
	@IBAction func tappedLeituraButton(_ sender: UIButton) {
		print(#function)
		//
		//		let autenticacao: Auth = Auth.auth()
		//		guard let user = autenticacao.currentUser else { return }
		//
		//		// Configurar Database
		//		let database = Database.database().reference()
		//		let listMovie = database.child("listwatch").child("usuarios").child(user.uid)
		////		let listMovie = database.child("listwatch").child("usuarios")
		//
		//		print("Usuario: \(String(describing: autenticacao.currentUser?.email))")
		//		print("UID: \(String(describing: autenticacao.currentUser?.uid))")
		//
		////		database.child("listwatch/usuarios/\(user.uid)/").getData { (error, snapshot) in
		//
		//		listMovie.getData { (error, snapshot) in
		//			if let _error = error {
		//				print("Não conseguiu ler")
		//				print(_error.localizedDescription)
		//			}
		//		}
		//
		//		//		listMovie.childgetData { (error, snapshot) in
		//		//			if let _error = error {
		//		//				print("Não conseguiu ler")
		//		//				print(_error.localizedDescription)
		//		//			}
		//		//
		//		//			if snapshot.exists() {
		//		//				print("Got data \(snapshot.value!)")
		//		//			} else {
		//		//				print("No data available")
		//		//			}
		//		//
		//		//		}
		//
	}
	
	@IBAction func tappedDeletarButton(_ sender: UIButton) {
		print(#function)
		if self.filmeIDTextField.text != "" {
			let listUserMovie = ref?.child("listwatch").child("usuarios").child(autenticacao?.currentUser?.uid ?? "")
			listUserMovie?.child(self.filmeIDTextField.text ?? "").removeValue()
		}
	}
	
}

