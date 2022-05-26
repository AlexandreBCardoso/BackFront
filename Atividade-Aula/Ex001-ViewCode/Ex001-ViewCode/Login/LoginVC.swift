//
//  ViewController.swift
//  Ex001-ViewCode
//
//  Created by Alexandre Cardoso on 29/03/21.
//

import UIKit

class LoginVC: UIViewController {
	
	// MARK: - Variable
	var loginScreen: LoginScreen?
	

	// MARK: - Lifecycle
	override func loadView() {
		self.loginScreen = LoginScreen()
		self.loginScreen?.delegate(delegate: self)
		self.view = loginScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}

}


extension LoginVC: LoginScreenProtocol {
	
	func actionLogin() {
		print(#function)
	}
	
	func actionRegister() {
		print(#function)
		self.navigationController?.pushViewController(RegisterViewController(), animated: true)
	}
	
}
