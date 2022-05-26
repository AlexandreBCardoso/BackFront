//
//  LoginWorker.swift
//  AutenticacaoFirebase
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import Foundation
import FirebaseAuth

class LoginWorker {
	
	func getStatusLogin(completion: @escaping(_ user: Any?) -> Void) {
		
		// Criação de Listener para saber se o User está logado
		Auth.auth().addStateDidChangeListener { (auth, user) in
			if auth.currentUser?.uid == nil {
				print("Sem Login")
				completion(nil)
			} else {
				print("Com Current User UID")
				completion(user)
			}
		}
		
	}
	
	func getLogin(email: String, password: String, completion: @escaping(_ usuario: Usuario?, _ error: NSError?) -> Void) {
		
		// Instancia de Autenticação
		let autenticacao: Auth = Auth.auth()
		
		// Chamada para Logar
		autenticacao.signIn(withEmail: email, password: password) { (authResult, error) in
			
			if error != nil {
				print(#function)
				completion(nil, NSError())
				
			} else {
				
				// Validar o authResult??
				completion(nil, nil)
				
			}
			
		}
		
	}
	
}
