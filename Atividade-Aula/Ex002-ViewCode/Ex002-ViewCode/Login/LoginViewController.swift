//
//  LoginViewController.swift
//  Ex002-ViewCode
//
//  Created by Alexandre Cardoso on 31/03/21.
//

import UIKit

class LoginViewController: UIViewController {

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
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print(#function)
	}

}


extension LoginViewController: LoginScreenProtocol {

	func actionLogin() {
		print(#function)
		let detVC = DetailUserVC()
		detVC.dados = "Dados"
		self.navigationController?.pushViewController(detVC, animated: true)
	}

	func actionRegister() {
		print(#function)
		self.navigationController?.pushViewController(RegisterViewController(), animated: true)
	}

}
