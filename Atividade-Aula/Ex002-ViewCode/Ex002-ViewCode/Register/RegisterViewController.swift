//
//  RegisterViewController.swift
//  Ex002-ViewCode
//
//  Created by Alexandre Cardoso on 31/03/21.
//

import UIKit

class RegisterViewController: UIViewController {
	
	// MARK: - Variable
	var registerScreen: RegisterScreen?
	
	
	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()
		self.registerScreen = RegisterScreen()
		self.registerScreen?.delegate(delegate: self)
		self.registerScreen?.configTextFieldDelegate(delegate: self)
		self.view = registerScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
}


// MARK: - Extension
extension RegisterViewController: RegisterScreenProtocol {
	
	func registerUser() {
		print(#function)
	}
	
	
	func actionVoltar() {
		print(#function)
		self.navigationController?.popViewController(animated: true)
	}
	
}


extension RegisterViewController: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print(#function)
	}
	
}

