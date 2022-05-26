//
//  LoginController.swift
//  AutenticacaoFirebase
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import Foundation

class LoginController {
	
	func getStatusLogin(completion: @escaping(_ succes: Bool) -> Void) {
		
		LoginWorker().getStatusLogin { (user) in
			
			if user == nil {
				completion(false)
			} else {
				completion(true)
			}
			
		}
		
	}
	
//	func signIn(completion: @escaping(_ success: Bool, _ error: NSError) -> Void) {
//		LoginWorker().getLogin(email: <#T##String#>, password: <#T##String#>, completion: <#T##(Usuario?, NSError?) -> Void#>)
//	}
	
}
